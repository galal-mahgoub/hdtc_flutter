import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_auth_repository.dart';

class UpdateProfileImgUseCase {
  final BaseAuthRepository baseAuthRepository;

  UpdateProfileImgUseCase({required this.baseAuthRepository});

  Future<Either<Failure, String>> call({
    required String image,
  }) async {
    return await baseAuthRepository.updateProfileImg(
      image: image,
    );
  }
}
