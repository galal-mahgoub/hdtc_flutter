import 'package:get/get.dart';

import '../../../../language_feature/domain/use_cases/save_language_use_case.dart';
import '../../../domain/use_cases/logout_use_case.dart';
import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LogoutUserUseCase(baseAuthRepository: Get.find()),
      fenix: true,
    );
    Get.lazyPut(
      () => SaveLanguageUseCase(baseLanguageRepository: Get.find()),
      fenix: true,
    );
   

    Get.lazyPut<SettingsController>(
      () => SettingsController(
        logoutUserUseCase: Get.find(),
        saveLanguageUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
