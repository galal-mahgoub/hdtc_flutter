import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_auth_repository.dart';

class SendForgotPasswordCodeUseCase {
  final BaseAuthRepository baseAuthRepository;

  SendForgotPasswordCodeUseCase({required this.baseAuthRepository});

  Future<Either<Failure, Unit>> call({
    required String email,
  }) async {
    return await baseAuthRepository.sendForgotPasswordCode(
      email: email,
    );
  }
}
