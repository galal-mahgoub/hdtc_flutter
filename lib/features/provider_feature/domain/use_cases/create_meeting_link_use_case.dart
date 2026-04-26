import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_provider_repository.dart';

class CreateMeetingLinkUseCase {
  final BaseProviderRepository baseProviderRepository;

  CreateMeetingLinkUseCase({required this.baseProviderRepository});

  Future<Either<Failure, String>> call({
    required String meetingId,
    required String link,
    required String? pass,
  }) async {
    return await baseProviderRepository.createMeetingLink(
      meetingId: meetingId,
      link: link,
      pass: pass,
    );
  }
}
