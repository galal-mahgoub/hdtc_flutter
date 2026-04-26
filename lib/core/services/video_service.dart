import 'dart:async';
import 'dart:developer' as d;
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../features/video_feature/domain/entities/video.dart';
import '../../features/video_feature/domain/use_cases/get_all_videos_use_case.dart';
import '../../features/video_feature/domain/use_cases/save_videos_use_case.dart';
import '../utils/toast_manager.dart';
import '../utils/utils.dart';

class VideoService extends SuperController {
  GetAllVideosUseCase getAllVideosUseCase;
  SaveVideosUseCase saveVideosUseCase;
  VideoService({
    required this.getAllVideosUseCase,
    required this.saveVideosUseCase,
  });

  static VideoService get to => Get.find();

  Rx<List<Video>> videos = Rx([]);
  final ReceivePort _port = ReceivePort();
  bool permissionReady = false;
  late String _localPath;

  Future<VideoService> init() async {
    _prepare();

    _bindBackgroundIsolate();
    FlutterDownloader.registerCallback(downloadCallback, step: 1);

    await getAllVideos();

    return this;
  }

  Future<void> requestDownload(
    Video value,
  ) async {
    Video? checkOldVideo = videos.value.firstWhereOrNull(
      (video) => video.itemId == value.itemId,
    );
    d.log("requestDownload==>$checkOldVideo");
    if (checkOldVideo != null) return;
    String? taskId = await FlutterDownloader.enqueue(
      url: value.taskInfo.value.link.value,
      savedDir: _localPath,
      showNotification: true,
      openFileFromNotification: true,
      timeout: 0,
      fileName: generateUniqueVideoName() + value.taskInfo.value.name.value,
    );
    d.log("requestDownload==>$taskId");
    Video? video = videos.value.firstWhereOrNull(
        (video) => video.taskInfo.value.taskId.value == taskId);
    if (taskId != null && video == null) {
      value.taskInfo.value.taskId.value = taskId;
      videos.value = [
        ...List.from(videos.value),
        value,
      ];

      d.log("==>${videos.value}");
    }
  }

  String generateUniqueVideoName() {
    // Get the current timestamp (milliseconds since epoch)
    final timestamp = DateTime.now().millisecondsSinceEpoch;

    // Generate a random identifier (6 digits)
    final random = Random();
    final randomId = random.nextInt(999999).toString().padLeft(6, '0');

    // Combine timestamp and random identifier to create a unique name
    return 'video_${timestamp}_${randomId}_';
  }

  removeVideo(int index) {
    FlutterDownloader.remove(
      taskId: videos.value[index].taskInfo.value.taskId.value,
      shouldDeleteContent: true,
    );

    videos.value.removeAt(index);
    videos.value = List.from(videos.value);
    saveVideos();
  }

  Future<void> _prepare() async {
    permissionReady = await _checkPermission();
    if (permissionReady) {
      await _prepareSaveDir();
    }
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await getExternalStorageDirectory())?.path ?? '';

    final savedDir = Directory(_localPath);
    if (!savedDir.existsSync()) {
      await savedDir.create();
    }
  }

  Future<bool> _checkPermission() async {
    if (Platform.isIOS) {
      return true;
    }

    if (Platform.isAndroid) {
      final info = await DeviceInfoPlugin().androidInfo;
      if (info.version.sdkInt > 28) {
        return true;
      }

      final status = await Permission.storage.status;
      if (status == PermissionStatus.granted) {
        return true;
      }

      final result = await Permission.storage.request();
      return result == PermissionStatus.granted;
    }

    throw StateError('unknown platform');
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
  }

  void _bindBackgroundIsolate() {
    final isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      final taskId = (data as List<dynamic>)[0] as String;
      final status = DownloadTaskStatus.fromInt(data[1] as int);
      final progress = data[2] as int;

      var task = videos.value
          .where((video) => video.taskInfo.value.taskId.value == taskId);
      for (var element in task) {
        element.taskInfo.value.progress.value = progress;
        element.taskInfo.value.status.value = status;
      }

      saveVideos();
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  Future getAllVideos() async {
    final result = await getAllVideosUseCase();
    d.log("getAllVideos==>$result");
    result.fold((failure) {}, (result) async {
      videos.value = result.cast<Video>();
    });
  }

  Future saveVideos() async {
    final result = await saveVideosUseCase(videos: videos.value);
    d.log("saveVideos==>$result");
    result.fold((failure) {
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {});
  }

  openVideo(int index) {
    FlutterDownloader.open(
      taskId: videos.value[index].taskInfo.value.taskId.value,
    );
  }

  pauseVideo(int index) {
    FlutterDownloader.pause(
      taskId: videos.value[index].taskInfo.value.taskId.value,
    );
  }

  retryVideo(int index) async {
    String? newTaskId = await FlutterDownloader.retry(
      taskId: videos.value[index].taskInfo.value.taskId.value,
    );
    if (newTaskId != null) {
      videos.value[index].taskInfo.value.taskId.value = newTaskId;
    }
  }

  resumeVideo(int index) async {
    String? newTaskId = await FlutterDownloader.resume(
      taskId: videos.value[index].taskInfo.value.taskId.value,
    );
    if (newTaskId != null) {
      videos.value[index].taskInfo.value.taskId.value = newTaskId;
    }
  }

  @override
  void onDetached() async {}

  @override
  void onHidden() {}

  @override
  void onInactive() {}

  @override
  void onPaused() async {
    d.log("onPaused");
    for (var video in videos.value) {
      if (video.taskInfo.value.status.value == DownloadTaskStatus.running) {
        await FlutterDownloader.pause(
          taskId: video.taskInfo.value.taskId.value,
        );
      }
    }
  }

  @override
  void onResumed() async {}
}
