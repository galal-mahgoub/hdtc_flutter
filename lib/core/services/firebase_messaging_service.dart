import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../features/notification_feature/presentation/notifications/controller/notifications_controller.dart';
import '../../features/others_feature/presentation/subscribe/controllers/subscribes_controller.dart';
import '../../features/provider_feature/presentation/meeting/controllers/meeting_controller.dart';
import '../routes/app_pages.dart';
import '../utils/toast_manager.dart';

class FireBaseMessagingService extends GetxService {
  Future<FireBaseMessagingService> init() async {
    FirebaseMessaging.instance
        .requestPermission(sound: true, badge: true, alert: true);
    await fcmOnLaunchListeners();
    await fcmOnResumeListeners();
    await fcmOnMessageListeners();
    return this;
  }

  Future fcmOnMessageListeners() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showNotification(message);
    });
  }

  Future fcmOnLaunchListeners() async {
    RemoteMessage? message =
        await FirebaseMessaging.instance.getInitialMessage();

    if (message != null) {
      _notificationsBackground(message);
    }
  }

  Future fcmOnResumeListeners() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _notificationsBackground(message);
    });
  }

  void _notificationsBackground(RemoteMessage message) {
    if (Get.currentRoute == Routes.notifications) {
      NotificationController.to.getAllNotifications();
    }
  }

  void _showNotification(RemoteMessage message) {
    if (Get.currentRoute == Routes.notifications &&
        Get.isRegistered<NotificationController>()) {
      NotificationController.to.getAllNotifications();
    }
    // TODO: to add subscribtions
    else if (Get.currentRoute == Routes.subscribes &&
        Get.isRegistered<SubscribesController>()) {
      SubscribesController.to.getSubscribes();
    } else if (Get.currentRoute == Routes.meeting &&
        Get.isRegistered<MeetingController>()) {
      MeetingController.to.getMeetings();
    }

    RemoteNotification? notification = message.notification;
    ToastManager.showNotification(
      title: notification?.title ?? '',
      message: notification?.body ?? '',
      onTap: (getBar) {
        Get.toNamed(
          Routes.notifications,
        );
      },
    );
  }
}
