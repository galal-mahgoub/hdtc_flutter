import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_provider_repository.dart';

class CreateMeetingUseCase {
  final BaseProviderRepository baseProviderRepository;

  CreateMeetingUseCase({required this.baseProviderRepository});

  Future<Either<Failure, Unit>> call({
   required String timeId,
    required String date,
    required String meetingType,
    required String description,
  }) async {
    return await baseProviderRepository.createMeeting(
      timeId: timeId,
        date: date,
        meetingType: meetingType,
        description: description,
    );
  }
}
