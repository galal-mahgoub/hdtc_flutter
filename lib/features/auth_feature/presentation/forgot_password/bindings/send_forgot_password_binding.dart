import 'package:get/get.dart';

import '../../../domain/use_cases/send_forgot_password_code_use_case.dart';
import '../controllers/send_forgot_password_controller.dart';

class SendForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SendForgotPasswordCodeUseCase(
        baseAuthRepository: Get.find(),
      ),
      tag: 'SendForgotPasswordBinding',
    );

    Get.lazyPut<SendForgotPasswordController>(
      () => SendForgotPasswordController(
        sendForgotPasswordCodeUseCase: Get.find(
          tag: 'SendForgotPasswordBinding',
        ),
      ),
    );
  }
}
