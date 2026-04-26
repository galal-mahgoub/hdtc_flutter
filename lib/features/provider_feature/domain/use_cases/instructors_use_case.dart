import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/provider.dart';
import '../repositories/base_provider_repository.dart';

class InstructorsUseCase {
  final BaseProviderRepository baseProviderRepository;

  InstructorsUseCase({required this.baseProviderRepository});

  Future<Either<Failure, List<Provider>>> call({
    String? sort,
    required List<String> categories,
  }) async {
    return await baseProviderRepository.instructors(
      sort: sort,
      categories: categories,
    );
  }
}
