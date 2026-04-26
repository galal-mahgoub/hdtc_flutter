import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_others_repository.dart';

class DeleteCommentUseCase {
  final BaseOthersRepository baseOthersRepository;

  DeleteCommentUseCase({required this.baseOthersRepository});

  Future<Either<Failure, String>> call({
    required String commentId,
  }) async {
    return await baseOthersRepository.deleteCommet(
      commentId: commentId,
    );
  }
}
