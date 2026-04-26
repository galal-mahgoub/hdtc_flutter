import 'package:get/get.dart';

import '../controllers/select_language_controller.dart';

class SelectLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectLanguageController>(
      () => SelectLanguageController(
        getLanguageUseCase: Get.find(),
        saveLanguageUseCase: Get.find(),
      ),
    );
  }
}
