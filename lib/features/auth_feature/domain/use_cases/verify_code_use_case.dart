import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user.dart';
import '../repositories/base_auth_repository.dart';

class VerifyCodeUseCase {
  final BaseAuthRepository baseAuthRepository;

  VerifyCodeUseCase({required this.baseAuthRepository});

  Future<Either<Failure, User>> call({
    required String code,
  }) async {
    return await baseAuthRepository.verifyCode(code: code);
  }
}
