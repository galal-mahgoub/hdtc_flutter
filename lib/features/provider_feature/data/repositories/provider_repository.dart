import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/handler.dart';
import '../../domain/repositories/base_provider_repository.dart';
import '../data_source/provider_remote_data_source.dart';
import '../models/provider_model.dart';
import '../models/reservation_model.dart' as r;
import '../models/time_model.dart';

class ProviderRespoitory implements BaseProviderRepository {
  final BaseProviderRemoteDataSource baseProviderRemoteDataSource;
  final FirebaseMessaging firebaseMessaging;
  final Handler handler;

  ProviderRespoitory({
    required this.baseProviderRemoteDataSource,
    required this.firebaseMessaging,
    required this.handler,
  });

  @override
  Future<Either<Failure, List<ProviderModel>>> instructors({
    required String? sort,
    required List<String> categories,
  }) async {
    return handler.asyncHandler<List<ProviderModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseProviderRemoteDataSource.instructors(
        sort: sort,
        categories: categories,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<ProviderModel>>> businessConsultations({
    required int availableMeetings,
    required int freeMeetings,
    required int discount,
    required int downloadable,
    required String sort,
  }) async {
    return handler.asyncHandler<List<ProviderModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseProviderRemoteDataSource.businessConsultations(
        availableMeetings: availableMeetings,
        freeMeetings: freeMeetings,
        discount: discount,
        downloadable: downloadable,
        sort: sort,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, ProviderModel>> getProviderInfo({
    required int providerId,
  }) async {
    return handler.asyncHandler<ProviderModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseProviderRemoteDataSource.getProviderInfo(
        providerId: providerId,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, Unit>> followProvider({
    required int providerId,
    required bool status,
  }) async {
    return handler.asyncHandler<Unit>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseProviderRemoteDataSource.followProvider(
        providerId: providerId,
        status: status,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<TimeModel>>> getConsultantMeetingsDate({
    required int providerId,
    required String date,
  }) async {
    return handler.asyncHandler<List<TimeModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseProviderRemoteDataSource.getConsultantMeetingsDate(
        providerId: providerId,
        date: date,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, Unit>> createMeeting({
    required String timeId,
    required String date,
    required String meetingType,
    required String description,
  }) async {
    return handler.asyncHandler<Unit>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseProviderRemoteDataSource.createMeeting(
        timeId: timeId,
        date: date,
        meetingType: meetingType,
        description: description,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, r.ReservationModel>> getMeetings() async {
    return handler.asyncHandler<r.ReservationModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseProviderRemoteDataSource.getMeetings(
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> finishMeeting({
    required String meetingId,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseProviderRemoteDataSource.finishMeeting(
        meetingId: meetingId,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> createMeetingLink({
    required String meetingId,
    required String link,
    required String? pass,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseProviderRemoteDataSource.createMeetingLink(
        meetingId: meetingId,
        link: link,
        pass: pass,
        token: token,
        lang: lang,
      );

      return data;
    });
  }
}
