import 'package:get/get.dart';

import '../../../../course_feature/domain/use_cases/get_purchases_courses_use_case.dart';
import '../../../domain/use_cases/get_departments_use_case.dart';
import '../../../domain/use_cases/get_myclass_tickets_use_case.dart';
import '../../../domain/use_cases/get_tickets_use_case.dart';
import '../../../domain/use_cases/send_ticket_use_case.dart';
import '../controllers/support_controller.dart';

class SupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetTicketsUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetMyClassTicketsUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetDepartmentUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetPurchasesCoursesUseCase(
        baseCourseRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => SendTicketUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<SupportController>(
      () => SupportController(
        getTicketsUseCase: Get.find(),
        getMyClassTicketsUseCase: Get.find(),
        getDepartmentUseCase: Get.find(),
        getPurchasesCoursesUseCase: Get.find(),
        sendTicketUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
