import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_others_repository.dart';

class DownloadCertificateUseCase {
  final BaseOthersRepository baseOthersRepository;

  DownloadCertificateUseCase({required this.baseOthersRepository});

  Future<Either<Failure, String>> call({
    required String downloadLink,
    required String title,
  }) async {
    return await baseOthersRepository.downloadCertificate(
      title: title,
      downloadLink: downloadLink,
    );
  }
}
