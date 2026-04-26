import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/time.dart';
import '../repositories/base_provider_repository.dart';

class GetConsultantMeetingsUseCase {
  final BaseProviderRepository baseProviderRepository;

  GetConsultantMeetingsUseCase({required this.baseProviderRepository});

  Future<Either<Failure, List<Time>>> call({
    required int providerId,
    required String date,
  }) async {
    return await baseProviderRepository.getConsultantMeetingsDate(
      providerId: providerId,
      date: date,
    );
  }
}
