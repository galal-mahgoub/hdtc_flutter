import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/notification.dart';
import '../repositories/base_notification_repository.dart';

class GetAllNotificationsUseCase {
  final BaseNotificationRepository baseNotificationRepository;

  GetAllNotificationsUseCase({required this.baseNotificationRepository});

  Future<Either<Failure, List<Notification>>> call({
    String? limit,
    String? offset,
  }) async {
    return await baseNotificationRepository.getNotifications(
      limit: limit,
      offset: offset,
    );
  }
}
