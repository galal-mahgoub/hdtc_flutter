import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/category_course.dart';
import '../repositories/base_category_repository.dart';

class GetCategoryCoursesUseCase {
  final BaseCategoryRepository baseCategoryRepository;

  GetCategoryCoursesUseCase({required this.baseCategoryRepository});

  Future<Either<Failure, CategoryCourse>> call({
    Map<String, Object>? query,
    required String categoryId,
  }) async {
    return await baseCategoryRepository.getCategoryCourses(
      query: query,
      categoryId: categoryId,
    );
  }
}
