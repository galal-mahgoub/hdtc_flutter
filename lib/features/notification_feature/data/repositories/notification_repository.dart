import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/handler.dart';
import '../../domain/repositories/base_notification_repository.dart';
import '../data_sources/notification_remote_data_source.dart';
import '../models/notification_model.dart';

class NotificationRespoitory implements BaseNotificationRepository {
  final BaseNotificationRemoteDataSource baseNotificationRemoteDataSource;
  final FirebaseMessaging firebaseMessaging;
  final Handler handler;

  NotificationRespoitory({
    required this.baseNotificationRemoteDataSource,
    required this.firebaseMessaging,
    required this.handler,
  });

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications({
    required String? limit,
    required String? offset,
  }) async {
    return handler.asyncHandler<List<NotificationModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseNotificationRemoteDataSource.getNotifications(
        limit: limit,
        offset: offset,
        token: token,
        lang: lang,
      );

      return data;
    });
  }
}
