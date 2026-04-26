import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/subscribe_respone.dart';
import '../repositories/base_others_repository.dart';

class GetSubscribesUseCase {
  final BaseOthersRepository baseOthersRepository;

  GetSubscribesUseCase({required this.baseOthersRepository});

  Future<Either<Failure,SubscriptionRespone>> call() async {
    return await baseOthersRepository.getSubscribes();
  }
}
