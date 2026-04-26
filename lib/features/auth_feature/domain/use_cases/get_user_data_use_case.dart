import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user.dart';
import '../repositories/base_auth_repository.dart';

class GetUserDataUseCase {
  final BaseAuthRepository baseAuthRepository;

  GetUserDataUseCase({required this.baseAuthRepository});

  Future<Either<Failure, User>> call() async {
    return await baseAuthRepository.getUserData();
  }
}
