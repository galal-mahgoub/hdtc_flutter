import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_cart_repository.dart';

class DeleteCartItemUseCase {
  final BaseCartRepository baseCartRepository;

  DeleteCartItemUseCase({required this.baseCartRepository});

  Future<Either<Failure, Unit>> call({
    required String itemId,
  }) async {
    return await baseCartRepository.deleteCartItem(
      itemId: itemId,
    );
  }
}
