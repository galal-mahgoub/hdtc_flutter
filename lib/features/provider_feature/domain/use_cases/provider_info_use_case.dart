import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/provider.dart';
import '../repositories/base_provider_repository.dart';

class ProviderInfoUseCase {
  final BaseProviderRepository baseProviderRepository;

  ProviderInfoUseCase({required this.baseProviderRepository});

  Future<Either<Failure, Provider>> call({
    required int providerId,
  }) async {
    return await baseProviderRepository.getProviderInfo(
      providerId: providerId,
    );
  }
}
