import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_auth_repository.dart';

class UpdateLocalizationUseCase {
  final BaseAuthRepository baseAuthRepository;

  UpdateLocalizationUseCase({required this.baseAuthRepository});

  Future<Either<Failure, String>> call({
    required String countryId,
    required String provinceId,
    required String cityId,
    required String districtId,
    required String timezone,
    required String address,
  }) async {
    return await baseAuthRepository.updateLocalization(
      countryId: countryId,
      provinceId: provinceId,
      cityId: cityId,
      districtId: districtId,
      timezone: timezone,
      address: address,
    );
  }
}
