import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/blog.dart';
import '../entities/blog_category.dart';

abstract class BaseBlogRepository {
  Future<Either<Failure, List<Blog>>> blogs({
    required String? offset,
    required String? limit,
    required int? categoryId,
  });

  Future<Either<Failure, List<BlogCategory>>> blogsCategories();

  Future<Either<Failure, String>> sendBlogComment({
    required String blodId,
    required String comment,
  });
}
