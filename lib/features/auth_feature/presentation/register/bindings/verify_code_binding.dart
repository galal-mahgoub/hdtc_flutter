import 'package:get/get.dart';

import '../../../domain/use_cases/resend_verify_code_use_case.dart';
import '../../../domain/use_cases/verify_code_use_case.dart';
import '../controllers/verify_code_controller.dart';

class VerifyCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => VerifyCodeUseCase(
        baseAuthRepository: Get.find(),
      ),
    );

    Get.lazyPut(
      () => ResendVerifyCodeUseCase(
        baseAuthRepository: Get.find(),
      ),
    );

    Get.lazyPut<VerifyCodeController>(
      () => VerifyCodeController(
        resendVerifyCodeUseCase: Get.find(),
        verifyCodeUseCase: Get.find(),
      ),
    );
  }
}
