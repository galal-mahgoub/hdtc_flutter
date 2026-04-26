import 'package:get/get.dart';

import '../../../domain/use_cases/get_meetings_use_case.dart';
import '../controllers/meeting_controller.dart';

class MeetingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetMeetingsUseCase(
        baseProviderRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<MeetingController>(
      () => MeetingController(
        getMeetingsUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
