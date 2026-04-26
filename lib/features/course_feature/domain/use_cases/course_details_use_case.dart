import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/course.dart';
import '../repositories/base_course_repository.dart';

class CourseDetailsUseCase {
  final BaseCourseRepository baseCourseRepository;

  CourseDetailsUseCase({required this.baseCourseRepository});

  Future<Either<Failure, Course>> call({
    required String courseId,
  }) async {
    return await baseCourseRepository.courseDetails(
      courseId: courseId,
    );
  }
}
