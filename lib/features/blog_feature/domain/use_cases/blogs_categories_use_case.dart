import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/blog_category.dart';
import '../repositories/base_blog_repository.dart';

class BlogsCategoriesUseCase {
  final BaseBlogRepository baseBlogRepository;

  BlogsCategoriesUseCase({required this.baseBlogRepository});

  Future<Either<Failure, List<BlogCategory>>> call() async {
    return await baseBlogRepository.blogsCategories();
  }
}
