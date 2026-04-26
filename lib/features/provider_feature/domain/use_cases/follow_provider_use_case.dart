import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_provider_repository.dart';

class FollowProviderUseCase {
  final BaseProviderRepository baseProviderRepository;

  FollowProviderUseCase({required this.baseProviderRepository});

  Future<Either<Failure, Unit>> call({
    required int providerId,
    required bool status,
  }) async {
    return await baseProviderRepository.followProvider(
      providerId: providerId,
      status: status,
    );
  }
}
