import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:hdtc_on/features/video_feature/data/models/video_model.dart';

import 'package:get_storage/get_storage.dart';

import '../../../../core/consts/k_strings.dart';
import '../../../../core/errors/exceptions.dart';

abstract class BaseVideoLocalDataSource {
  Future<List<VideoModel>> readVideos();
  Future<Unit> writeVideos({required List<VideoModel> videos});
  Future<Unit> removeVideos();
}

class VideoLocalDataSource implements BaseVideoLocalDataSource {
  final GetStorage getStorage;

  VideoLocalDataSource({
    required this.getStorage,
  });

  ///-------------- USER DATA ------------------------------------------------
  @override
  Future<List<VideoModel>> readVideos() async {
    final data = await getStorage.read(Kstrings.videStorage);
    if (data != null) {
      return Future.value(
        List.from(data)
            .map(
              (e) => VideoModel.fromJson(e),
            )
            .toList(),
      );
    } else {
      return Future.value([]);
    }
  }

  @override
  Future<Unit> writeVideos({required List<VideoModel> videos}) async {
    try {
      await getStorage.write(
        Kstrings.videStorage,
        videos
            .map(
              (e) => (e).toJson(),
            )
            .toList(),
      );

      return Future.value(unit);
    } catch (e) {
      throw ValidationException(message: e.toString());
    }
  }

  @override
  Future<Unit> removeVideos() async {
    try {
      await getStorage.remove(Kstrings.videStorage);

      return Future.value(unit);
    } catch (e) {
      throw ValidationException(message: e.toString());
    }
  }
}
