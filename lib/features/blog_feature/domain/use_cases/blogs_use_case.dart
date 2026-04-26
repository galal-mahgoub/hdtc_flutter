import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/blog.dart';
import '../repositories/base_blog_repository.dart';

class BlogsUseCase {
  final BaseBlogRepository baseBlogRepository;

  BlogsUseCase({required this.baseBlogRepository});

  Future<Either<Failure, List<Blog>>> call({
    String? offset,
    String? limit,
    int? categoryId,
  }) async {
    return await baseBlogRepository.blogs(
      offset: offset,
      limit: limit,
      categoryId: categoryId,
    );
  }
}
