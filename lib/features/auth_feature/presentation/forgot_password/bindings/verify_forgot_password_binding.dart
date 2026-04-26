import 'package:get/get.dart';

import '../../../domain/use_cases/send_forgot_password_code_use_case.dart';
import '../../../domain/use_cases/verify_forgot_password_code_use_case.dart';
import '../controllers/verify_forgot_password_controller.dart';

class VerifyForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => VerifyForgotPasswordCodeUseCase(
        baseAuthRepository: Get.find(),
      ),
    );
    Get.lazyPut(
      () => SendForgotPasswordCodeUseCase(
        baseAuthRepository: Get.find(),
      ),
      tag: 'SendForgotPasswordBinding',
    );

    Get.lazyPut<VerifyForgotPasswordController>(
      () => VerifyForgotPasswordController(
        sendForgotPasswordCodeUseCase: Get.find(
          tag: 'SendForgotPasswordBinding',
        ),
        verifyForgotPasswordCodeUseCase: Get.find(),
      ),
    );
  }
}
