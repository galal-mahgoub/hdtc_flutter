import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_others_repository.dart';

class CheckSubscriptionUseCase {
  final BaseOthersRepository baseOthersRepository;

  CheckSubscriptionUseCase({required this.baseOthersRepository});

  Future<Either<Failure, String>> call({
    required String subscribeId,
  }) async {
    return await baseOthersRepository.checkoutSubscription(
      subscribeId: subscribeId,
    );
  }
}
