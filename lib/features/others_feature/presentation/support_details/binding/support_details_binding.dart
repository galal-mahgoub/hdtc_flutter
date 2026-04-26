import 'package:get/get.dart';

import '../../../domain/use_cases/close_ticket_use_case.dart';
import '../../../domain/use_cases/reply_ticket_use_case.dart';
import '../controllers/support_details_controller.dart';

class SupportDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CloseTicketUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => ReplyTicketUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<SupportDetailsController>(
      () => SupportDetailsController(
        closeTicketUseCase: Get.find(),
        replyTicketUseCase: Get.find(),
      ),
    );
  }
}
