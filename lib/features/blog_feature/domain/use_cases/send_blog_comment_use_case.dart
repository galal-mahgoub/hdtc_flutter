import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_blog_repository.dart';

class SendBlogCommentUseCase {
  final BaseBlogRepository baseBlogRepository;

  SendBlogCommentUseCase({required this.baseBlogRepository});

  Future<Either<Failure, String>> call({
    required String blodId,
    required String comment,
  }) async {
    return await baseBlogRepository.sendBlogComment(
      blodId: blodId,
      comment: comment,
    );
  }
}
