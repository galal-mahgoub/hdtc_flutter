import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/download.dart';
import '../repositories/base_course_repository.dart';

class ReadDownloadedVideosUseCase {
  final BaseCourseRepository baseCourseRepository;

  ReadDownloadedVideosUseCase({required this.baseCourseRepository});

  Future<Either<Failure, List<DownLoad>>> call() async {
    return await baseCourseRepository.readDownloadedVideos();
  }
}
