import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/cart.dart';
import '../repositories/base_cart_repository.dart';

class CheckCouponUseCase {
  final BaseCartRepository baseCartRepository;

  CheckCouponUseCase({required this.baseCartRepository});

  Future<Either<Failure, Cart?>> call({
    required String coupon,
  }) async {
    return await baseCartRepository.checkCoupon(
      coupon: coupon,
    );
  }
}
