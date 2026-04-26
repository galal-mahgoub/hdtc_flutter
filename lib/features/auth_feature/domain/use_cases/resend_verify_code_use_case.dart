import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_auth_repository.dart';

class ResendVerifyCodeUseCase {
  final BaseAuthRepository baseAuthRepository;

  ResendVerifyCodeUseCase({required this.baseAuthRepository});

  Future<Either<Failure, Unit>> call() async {
    return await baseAuthRepository.resendVerifyCode();
  }
}
