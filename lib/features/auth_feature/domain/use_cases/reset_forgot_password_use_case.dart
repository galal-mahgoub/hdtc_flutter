import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user.dart';
import '../repositories/base_auth_repository.dart';

class ResetForgotPasswordUseCase {
  final BaseAuthRepository baseAuthRepository;

  ResetForgotPasswordUseCase({required this.baseAuthRepository});

  Future<Either<Failure, User>> call({
    required String email,
    required String token,
    required String code,
    required String pass,
    required String confirmPass,
  }) async {
    return await baseAuthRepository.resetForgotPassword(
      email: email,
      code: code,
      pass: pass,
      confirmPass: confirmPass,
    );
  }
}
