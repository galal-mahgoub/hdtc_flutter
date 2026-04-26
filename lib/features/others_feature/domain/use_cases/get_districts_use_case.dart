import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/country.dart';
import '../repositories/base_others_repository.dart';

class GetDistrictsUseCase {
  final BaseOthersRepository baseOthersRepository;

  GetDistrictsUseCase({required this.baseOthersRepository});

  Future<Either<Failure, List<Country>>> call({
    required String cityId,
  }) async {
    return await baseOthersRepository.getDistricts(cityId: cityId);
  }
}
