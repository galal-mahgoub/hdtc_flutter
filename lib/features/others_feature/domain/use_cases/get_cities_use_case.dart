import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/country.dart';
import '../repositories/base_others_repository.dart';

class GeCitiesUseCase {
  final BaseOthersRepository baseOthersRepository;

  GeCitiesUseCase({required this.baseOthersRepository});

  Future<Either<Failure, List<Country>>> call({
    required String provinceId,
  }) async {
    return await baseOthersRepository.getCities(provinceId: provinceId);
  }
}
