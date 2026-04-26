import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/notice.dart';
import '../repositories/base_course_repository.dart';

class GetNoticesUseCase {
  final BaseCourseRepository baseCourseRepository;

  GetNoticesUseCase({required this.baseCourseRepository});

  Future<Either<Failure, List<Notice>>> call({
    required String courseId,
  }) async {
    return await baseCourseRepository.getNotices(
      courseId: courseId,
    );
  }
}
