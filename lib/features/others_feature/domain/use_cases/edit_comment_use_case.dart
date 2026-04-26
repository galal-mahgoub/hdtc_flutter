import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_others_repository.dart';

class EditCommentUseCase {
  final BaseOthersRepository baseOthersRepository;

  EditCommentUseCase({required this.baseOthersRepository});

  Future<Either<Failure, String>> call({
    required String commentId,
    required String comment,
  }) async {
    return await baseOthersRepository.editComment(
      commentId: commentId,
      comment: comment,
    );
  }
}
