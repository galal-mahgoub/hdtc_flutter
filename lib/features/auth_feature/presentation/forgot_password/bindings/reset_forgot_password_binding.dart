import 'package:get/get.dart';

import '../../../domain/use_cases/reset_forgot_password_use_case.dart';
import '../controllers/reset_forgot_password_controller.dart';

class ResetForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ResetForgotPasswordUseCase(
        baseAuthRepository: Get.find(),
      ),
    );

    Get.lazyPut<ResetForgotPasswordController>(
      () => ResetForgotPasswordController(
        resetForgotPasswordUseCase: Get.find(),
      ),
    );
  }
}
