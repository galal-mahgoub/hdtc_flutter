import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/provider.dart';
import '../entities/reservation.dart' as r;
import '../entities/time.dart';

abstract class BaseProviderRepository {
  Future<Either<Failure, List<Provider>>> instructors({
    required String? sort,
    required List<String> categories,
  });

  Future<Either<Failure, List<Provider>>> businessConsultations({
    required int availableMeetings,
    required int freeMeetings,
    required int discount,
    required int downloadable,
    required String sort,
  });

  Future<Either<Failure, Provider>> getProviderInfo({
    required int providerId,
  });

  Future<Either<Failure, Unit>> followProvider({
    required int providerId,
    required bool status,
  });

  Future<Either<Failure, List<Time>>> getConsultantMeetingsDate({
    required int providerId,
    required String date,
  });

  Future<Either<Failure, Unit>> createMeeting({
    required String timeId,
    required String date,
    required String meetingType,
    required String description,
  });

  Future<Either<Failure, r.Reservation>> getMeetings();

  Future<Either<Failure, String>> finishMeeting({
    required String meetingId,
  });

  Future<Either<Failure, String>> createMeetingLink({
    required String meetingId,
    required String link,
    required String? pass,
  });
}
