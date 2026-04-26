import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_auth_repository.dart';

class UpdateProfileUseCase {
  final BaseAuthRepository baseAuthRepository;

  UpdateProfileUseCase({required this.baseAuthRepository});

  Future<Either<Failure, String>> call({
    required String name,
    required String mobile,
    required bool newsletter,
    required bool publicMessage,
    required bool supportSignLang,
  }) async {
    return await baseAuthRepository.updateProfile(
      name: name,
      mobile: mobile,
      newsletter: newsletter,
      publicMessage: publicMessage,
      supportSignLang: supportSignLang,
    );
  }
}
