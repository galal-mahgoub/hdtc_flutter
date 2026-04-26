import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/country.dart';
import '../repositories/base_others_repository.dart';

class GetProvincesUseCase {
  final BaseOthersRepository baseOthersRepository;

  GetProvincesUseCase({required this.baseOthersRepository});

  Future<Either<Failure, List<Country>>> call({
    required String countryId,
  }) async {
    return await baseOthersRepository.getProvinces(countryId: countryId);
  }
}
