import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user.dart';
import '../repositories/base_auth_repository.dart';

class LoginUseCase {
  final BaseAuthRepository baseAuthRepository;

  LoginUseCase({required this.baseAuthRepository});

  Future<Either<Failure, User>> call({
    required String email,
    required String password,
  }) async {
    return await baseAuthRepository.login(
      email: email,
      password: password,
    );
  }
}
