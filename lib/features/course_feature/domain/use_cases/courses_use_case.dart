import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/course.dart';
import '../repositories/base_course_repository.dart';

class CoursesUseCase {
  final BaseCourseRepository baseCourseRepository;

  CoursesUseCase({required this.baseCourseRepository});

  Future<Either<Failure, List<Course>>> call({
    String? sort,
    String? offset,
    String? limit,
    bool? isFree,
    String? categoryId,
    Map<String, Object>? query,
  }) async {
    return await baseCourseRepository.courses(
      sort: sort,
      offset: offset,
      limit: limit,
      isFree: isFree,
      categoryId: categoryId,
      query: query,
    );
  }
}
