import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/video.dart';

abstract class BaseVideoRepository {
  Future<Either<Failure, List<Video>>> readVideos();
  Future<Either<Failure, Unit>> writeVideos({required List<Video> videos});
  Future<Either<Failure, Unit>> removeVideos();
}
