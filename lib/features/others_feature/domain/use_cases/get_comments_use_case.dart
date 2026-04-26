import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/comments_respone.dart';
import '../repositories/base_others_repository.dart';

class GetCommentsUseCase {
  final BaseOthersRepository baseOthersRepository;

  GetCommentsUseCase({required this.baseOthersRepository});

  Future<Either<Failure, CommentRespone>> call() async {
    return await baseOthersRepository.getCommets();
  }
}
