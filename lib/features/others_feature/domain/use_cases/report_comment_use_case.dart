import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_others_repository.dart';

class ReportCommentUseCase {
  final BaseOthersRepository baseOthersRepository;

  ReportCommentUseCase({required this.baseOthersRepository});

  Future<Either<Failure, String>> call({
    required String commentId,
    required String message,
  }) async {
    return await baseOthersRepository.reportComment(
      commentId: commentId,
      message: message,
    );
  }
}
