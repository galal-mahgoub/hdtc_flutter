import 'package:hdtc_on/core/services/video_service.dart';
import 'package:hdtc_on/core/utils/toast_manager.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/read_lesson_use_case.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../video_feature/domain/entities/task_info.dart';
import '../../../../video_feature/domain/entities/video.dart';
import '../../../domain/entities/content.dart';
import '../../../domain/entities/course.dart';
import '../../../domain/entities/files_chapter.dart';

class ContentFilesController extends GetxController {
  ReadLessonUseCase readLessonUseCase;
  ContentFilesController({
    required this.readLessonUseCase,
  });

  File? itemContentDetails;
  Session? sessionDetails;
  Course? course;
  Item? item;
  Content? content;

  bool load = true;
  bool isLoading = false;
  bool isDownloadLoading = false;

  bool isEdited = false;

  Future<void> downloadVideos(
    File contentDetails,
    String titleCourse,
    String idCourse,
  ) async {
    isDownloadLoading = true;
    update();

    await VideoService.to.requestDownload(Video(
      courseId: Rx(course!.id.toString()),
      itemId: Rx(item!.id.toString()),
      type: Rx(course!.type!),
      title: Rx(item!.title ?? itemContentDetails!.title),
      courseTitle: Rx(course!.title),
      taskInfo: TaskInfo(
        name: Rx(contentDetails.file.split('/').last),
        link: Rx(contentDetails.file),
        status: Rx(DownloadTaskStatus.undefined),
        taskId: Rx(''),
        progress: Rx(0),
      ).obs,
    ));
    isDownloadLoading = false;
    update();
  }

  Future<void> readLesson(bool value) async {
    isEdited = true;
    isLoading = true;
    update();
    var result = await readLessonUseCase(
      courseId: course!.id.toString(),
      itemId: itemContentDetails!.id.toString(),
      status: value,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      item!.authHasRead = value;
      isLoading = false;
      update();

      ToastManager.showSuccess(result);
    });
  }

  @override
  void onInit() {
    Get.log(Get.arguments.toString());
    itemContentDetails = Get.arguments?['file'];

    content = Get.arguments['content'];
    course = Get.arguments['course'];

    item = Get.arguments?['item'];
    super.onInit();
  }
}
