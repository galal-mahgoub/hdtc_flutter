import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/provider.dart';
import '../repositories/base_provider_repository.dart';

class BusinessConsultationsUseCase {
  final BaseProviderRepository baseProviderRepository;

  BusinessConsultationsUseCase({required this.baseProviderRepository});

  Future<Either<Failure, List<Provider>>> call({
    required int availableMeetings,
    required int freeMeetings,
    required int discount,
    required int downloadable,
    required String sort,
  }) async {
    return await baseProviderRepository.businessConsultations(
      availableMeetings: availableMeetings,
      freeMeetings: freeMeetings,
      discount: discount,
      downloadable: downloadable,
      sort: sort,
    );
  }
}
