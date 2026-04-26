import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/course.dart';
import '../repositories/base_course_repository.dart';

class SearchCoursesUseCase {
  final BaseCourseRepository baseCourseRepository;

  SearchCoursesUseCase({required this.baseCourseRepository});

  Future<Either<Failure, List<Course>>> call({
    String? search,
    String? offset,
    String? limit,
  }) async {
    return await baseCourseRepository.searchCourses(
      search: search,
      offset: offset,
      limit: limit,
    );
  }
}
