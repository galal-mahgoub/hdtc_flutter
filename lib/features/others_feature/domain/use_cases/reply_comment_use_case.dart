import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_others_repository.dart';

class ReplyCommentUseCase {
  final BaseOthersRepository baseOthersRepository;

  ReplyCommentUseCase({required this.baseOthersRepository});

  Future<Either<Failure, String>> call({
    required String commentId,
    required String reply,
  }) async {
    return await baseOthersRepository.replyComment(
      commentId: commentId,
      reply: reply,
    );
  }
}
