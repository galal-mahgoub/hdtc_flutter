import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_cart_repository.dart';

class CheckoutUseCase {
  final BaseCartRepository baseCartRepository;

  CheckoutUseCase({required this.baseCartRepository});

  Future<Either<Failure, String>> call({
    required String? couponId,
  }) async {
    return await baseCartRepository.checkOut(
      couponId: couponId,
    );
  }
}
