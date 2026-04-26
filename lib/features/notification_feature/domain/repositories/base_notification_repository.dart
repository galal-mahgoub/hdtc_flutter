import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/notification.dart';

abstract class BaseNotificationRepository {
  Future<Either<Failure, List<Notification>>> getNotifications({
    required String? limit,
    required String? offset,
  });
}
