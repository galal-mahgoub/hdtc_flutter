import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/cart.dart';
import '../repositories/base_cart_repository.dart';

class GetCartListUseCase {
  final BaseCartRepository baseCartRepository;

  GetCartListUseCase({required this.baseCartRepository});

  Future<Either<Failure, Cart?>> call() async {
    return await baseCartRepository.getCartList();
  }
}
