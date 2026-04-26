import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_auth_repository.dart';

class ChangePasswordUseCase {
  final BaseAuthRepository baseAuthRepository;

  ChangePasswordUseCase({required this.baseAuthRepository});

  Future<Either<Failure, Unit>> call({
    required String oldPass,
    required String pass,
    required String confirmPass,
  }) async {
    return await baseAuthRepository.changePassword(
      oldPass: oldPass,
      pass: pass,
      confirmPass: confirmPass,
    );
  }
}
