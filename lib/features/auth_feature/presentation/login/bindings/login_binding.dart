import 'package:get/get.dart';

import '../../../domain/use_cases/login_use_case.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginUseCase(
        baseAuthRepository: Get.find(),
      ),
    );

    Get.lazyPut<LoginController>(
      () => LoginController(
        loginUseCase: Get.find(),
      ),
    );
  }
}
