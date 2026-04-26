import 'package:hdtc_on/features/notification_feature/domain/use_cases/get_all_notifications_use_case.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/notification.dart' as n;

class NotificationController extends GetxController {
  GetAllNotificationsUseCase getAllNotificationsUseCase;
  NotificationController({
    required this.getAllNotificationsUseCase,
  });

  static NotificationController get to => Get.find();

  late PagingController<int, n.Notification> pagingController;
  String offset = '1';
  String sort = '';

  Future<void> getAllNotifications() async {
    var result = await getAllNotificationsUseCase(
      offset: offset,
      limit: '10',
    );

    result.fold((failure) {
      pagingController.error = failure.message;

      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      if (isClosed) {
        return;
      }
      if (result.length >= 10) {
        offset = (int.parse(offset) + 1).toString();
        pagingController.appendPage(result, int.parse(offset));
      } else {
        pagingController.appendLastPage(result);
      }
    });
  }

  @override
  void onInit() async {
    pagingController = PagingController(firstPageKey: int.parse(offset));
    pagingController.addPageRequestListener((pageKey) async {
      await getAllNotifications();
    });

    super.onInit();
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}
