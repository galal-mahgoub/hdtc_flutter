import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/country.dart';
import '../repositories/base_others_repository.dart';

class GetCountriesUseCase {
  final BaseOthersRepository baseOthersRepository;

  GetCountriesUseCase({required this.baseOthersRepository});

  Future<Either<Failure, List<Country>>> call() async {
    return await baseOthersRepository.getCountries();
  }
}
