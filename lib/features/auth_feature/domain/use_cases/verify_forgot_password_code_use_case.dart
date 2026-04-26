import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_auth_repository.dart';

class VerifyForgotPasswordCodeUseCase {
  final BaseAuthRepository baseAuthRepository;

  VerifyForgotPasswordCodeUseCase({required this.baseAuthRepository});

  Future<Either<Failure, Unit>> call({
    required String email,
    required String code,
  }) async {
    return await baseAuthRepository.verifyForgotPasswordCode(
      email: email,
      code: code,
    );
  }
}
