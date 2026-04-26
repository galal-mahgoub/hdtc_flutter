import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/cart.dart';

abstract class BaseCartRepository {
  Future<Either<Failure, Cart?>> getCartList();

  Future<Either<Failure, Unit>> deleteCartItem({
    required String itemId,
  });

  Future<Either<Failure, Cart?>> checkCoupon({
    required String coupon,
  });

  Future<Either<Failure, String>> checkOut({
    required String ?couponId,
  });
}
