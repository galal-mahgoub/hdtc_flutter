import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_course_repository.dart';

class RemoveDownloadedVideosUseCase {
  final BaseCourseRepository baseCourseRepository;

  RemoveDownloadedVideosUseCase({required this.baseCourseRepository});

  Future<Either<Failure, Unit>> call() async {
    return await baseCourseRepository.removeDownloadedVideos();
  }
}
