import 'package:get/get.dart';

import '../../../domain/use_cases/create_meeting_link_use_case.dart';
import '../../../domain/use_cases/finish_meeting_use_case.dart';
import '../controllers/meeting_details_controller.dart';

class MeetingDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FinishMeetingUseCase(
        baseProviderRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => CreateMeetingLinkUseCase(
        baseProviderRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<MeetingDetailsController>(
      () => MeetingDetailsController(
        finishMeetingUseCase: Get.find(),
        createMeetingLinkUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
