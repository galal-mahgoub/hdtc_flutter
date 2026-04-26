import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_auth_repository.dart';

class GetCountryUseCase {
  final BaseAuthRepository baseAuthRepository;

  GetCountryUseCase({required this.baseAuthRepository});

  Future<Either<Failure, bool>> call() async {
    return await baseAuthRepository.getCountry();
  }
}
