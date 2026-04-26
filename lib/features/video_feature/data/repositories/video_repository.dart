import 'package:dartz/dartz.dart';
import 'package:hdtc_on/features/video_feature/data/models/task_info_model.dart';
import 'package:get/get.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/handler.dart';
import '../../domain/entities/video.dart';
import '../../domain/repositories/base_video_repository.dart';
import '../data_sources/video_local_data_source.dart';
import '../models/video_model.dart';

class VideoRespoitory implements BaseVideoRepository {
  final BaseVideoLocalDataSource baseVideoLocalDataSource;
  final Handler handler;

  VideoRespoitory({
    required this.baseVideoLocalDataSource,
    required this.handler,
  });

  @override
  Future<Either<Failure, List<VideoModel>>> readVideos() async {
    return handler.asyncHandler<List<VideoModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      final data = await baseVideoLocalDataSource.readVideos();

      return data;
    });
  }

  @override
  Future<Either<Failure, Unit>> writeVideos(
      {required List<Video> videos}) async {
    return handler.asyncHandler<Unit>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      final data = await baseVideoLocalDataSource.writeVideos(
        videos: videos
            .map(
              (e) => VideoModel(
                courseId: e.courseId,
                itemId: e.itemId,
                type: e.type,
                title: e.title,
                courseTitle: e.courseTitle,
                taskInfo: TaskInfoModel(
                  name: e.taskInfo.value.name,
                  link: e.taskInfo.value.link,
                  taskId: e.taskInfo.value.taskId,
                  progress: e.taskInfo.value.progress,
                  status: e.taskInfo.value.status,
                ).obs,
              ),
            )
            .toList(),
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, Unit>> removeVideos() async {
    return handler.asyncHandler<Unit>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      final data = await baseVideoLocalDataSource.removeVideos();

      return data;
    });
  }
}
