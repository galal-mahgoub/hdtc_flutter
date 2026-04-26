import 'package:get/get.dart';

import '../controllers/instructor_details_controller.dart';

class InstructorDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstructorDetailsController>(
      () => InstructorDetailsController(
        providerInfoUseCase: Get.find(),
        followProviderUseCase: Get.find(),
        getConsultantMeetingsUseCase: Get.find(),
        createMeetingUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
