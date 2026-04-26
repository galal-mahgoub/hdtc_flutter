import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_provider_repository.dart';

class FinishMeetingUseCase {
  final BaseProviderRepository baseProviderRepository;

  FinishMeetingUseCase({required this.baseProviderRepository});

  Future<Either<Failure, String>> call({
    required String meetingId,
  }) async {
    return await baseProviderRepository.finishMeeting(
      meetingId: meetingId,
    );
  }
}
