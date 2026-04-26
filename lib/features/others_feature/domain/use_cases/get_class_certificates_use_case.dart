import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/certificate.dart';
import '../repositories/base_others_repository.dart';

class GetClassCertificatesUseCase {
  final BaseOthersRepository baseOthersRepository;

  GetClassCertificatesUseCase({required this.baseOthersRepository});

  Future<Either<Failure, List<Certificate>>> call() async {
    return await baseOthersRepository.getClassCertificates();
  }
}
