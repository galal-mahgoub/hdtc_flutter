import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user.dart';
import '../repositories/base_auth_repository.dart';

class RegisterUseCase {
  final BaseAuthRepository baseAuthRepository;

  RegisterUseCase({required this.baseAuthRepository});

  Future<Either<Failure, User>> call({
    required String name,
    required String countryCode,
    required String mobile,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    return await baseAuthRepository.register(
      name: name,
      mobile: mobile,
      countryCode: countryCode,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
    );
  }
}
