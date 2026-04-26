import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/reservation.dart';
import '../repositories/base_provider_repository.dart';

class GetMeetingsUseCase {
  final BaseProviderRepository baseProviderRepository;

  GetMeetingsUseCase({required this.baseProviderRepository});

  Future<Either<Failure, Reservation>> call() async {
    return await baseProviderRepository.getMeetings();
  }
}
