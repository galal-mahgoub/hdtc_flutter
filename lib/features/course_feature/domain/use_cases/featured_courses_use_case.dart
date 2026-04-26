import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/course.dart';
import '../repositories/base_course_repository.dart';

class FeaturedCoursesUseCase {
  final BaseCourseRepository baseCourseRepository;

  FeaturedCoursesUseCase({required this.baseCourseRepository});

  Future<Either<Failure, List<Course>>> call({String? categoryId}) async {
    return await baseCourseRepository.featuredCourses(
      categoryId: categoryId,
    );
  }
}
