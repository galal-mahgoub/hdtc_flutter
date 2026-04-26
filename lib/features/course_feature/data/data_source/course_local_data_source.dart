import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/consts/k_strings.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/download_model.dart';

abstract class BaseCourseLocalDataSource {
  Future<List<DownLoadModel>> readDownloadedVideos();
  Future<Unit> writeDownloadedVideos({required DownLoadModel download});
  Future<Unit> removeDownloadedVideos();
}

class CourseLocalDataSource implements BaseCourseLocalDataSource {
  final GetStorage getStorage;
  final FlutterSecureStorage flutterSecureStorage;

  CourseLocalDataSource({
    required this.getStorage,
    required this.flutterSecureStorage,
  });

  ///-------------- USER DATA ------------------------------------------------
  @override
  Future<List<DownLoadModel>> readDownloadedVideos() async {
    try {
      final data = await getStorage.read(Kstrings.videStorage);

      if (data == null) {
        return [];
      }

      return Future.value(
          List.from(data).map((e) => DownLoadModel.fromJson(e)).toList());
    } catch (e) {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> writeDownloadedVideos({required DownLoadModel download}) async {
    try {
      List<DownLoadModel> data = await readDownloadedVideos();

      data.add(download);

      await getStorage.write(
        Kstrings.videStorage,
        data.map((e) => e.toJson()).toList(),
      );

      return Future.value(unit);
    } catch (e) {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> removeDownloadedVideos() async {
    try {
      await getStorage.remove(Kstrings.videStorage);

      return Future.value(unit);
    } catch (e) {
      throw EmptyCacheException();
    }
  }
}
