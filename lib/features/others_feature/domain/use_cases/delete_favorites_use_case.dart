import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_others_repository.dart';

class DeleteFavoriteUseCase {
  final BaseOthersRepository baseOthersRepository;

  DeleteFavoriteUseCase({required this.baseOthersRepository});

  Future<Either<Failure, String>> call({
    required String favId,
  }) async {
    return await baseOthersRepository.deleteFavourite(
      favId: favId,
    );
  }
}
