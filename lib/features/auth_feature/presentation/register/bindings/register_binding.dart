import 'package:get/get.dart';

import '../../../domain/use_cases/register_use_case.dart';
import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RegisterUseCase(
        baseAuthRepository: Get.find(),
      ),
    );

    Get.lazyPut<RegisterController>(
      () => RegisterController(
        
        registerUseCase: Get.find(),
      ),
    );
  }
}
