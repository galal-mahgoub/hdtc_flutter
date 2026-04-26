import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_course_repository.dart';

class ReplyToCommentUseCase {
  final BaseCourseRepository baseCourseRepository;

  ReplyToCommentUseCase({required this.baseCourseRepository});

  Future<Either<Failure, String>> call({
    required String commentId,
    required String reply,
  }) async {
    return await baseCourseRepository.replyToComment(
      commentId: commentId,
      reply: reply,
    );
  }
}
