import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/course.dart';
import '../repositories/base_course_repository.dart';

class MyCoursesUseCase {
  final BaseCourseRepository baseCourseRepository;

  MyCoursesUseCase({required this.baseCourseRepository});

  Future<Either<Failure, List<Course>>> call() async {
    return await baseCourseRepository.myCourses();
  }
}
