import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/quick_info.dart';
import '../repositories/base_auth_repository.dart';

class GetQuickInfoUseCase {
  final BaseAuthRepository baseAuthRepository;

  GetQuickInfoUseCase({required this.baseAuthRepository});

  Future<Either<Failure, QuickInfo>> call() async {
    return await baseAuthRepository.quickInfo();
  }
}
