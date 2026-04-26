import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/category.dart';
import '../entities/category_course.dart';

abstract class BaseCategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories();

  Future<Either<Failure, List<Category>>> getTrendCategories();

  Future<Either<Failure, CategoryCourse>> getCategoryCourses({
    Map<String, Object>? query,
    required String categoryId,
  });
}
