import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/certificate.dart';
import '../repositories/base_others_repository.dart';

class GetCompletionCertificatesUseCase {
  final BaseOthersRepository baseOthersRepository;

  GetCompletionCertificatesUseCase({required this.baseOthersRepository});

  Future<Either<Failure, List<Certificate>>> call() async {
    return await baseOthersRepository.getCompletion();
  }
}
