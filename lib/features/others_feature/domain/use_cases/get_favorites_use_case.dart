import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/favorite.dart';
import '../repositories/base_others_repository.dart';

class GetFavoriteUseCase {
  final BaseOthersRepository baseOthersRepository;

  GetFavoriteUseCase({required this.baseOthersRepository});

  Future<Either<Failure, List<Favorite>>> call() async {
    return await baseOthersRepository.getFavourite();
  }
}
