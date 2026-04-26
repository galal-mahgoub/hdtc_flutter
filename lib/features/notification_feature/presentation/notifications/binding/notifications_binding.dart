import 'package:get/get.dart';

import '../controller/notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(
      () => NotificationController(
        getAllNotificationsUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
