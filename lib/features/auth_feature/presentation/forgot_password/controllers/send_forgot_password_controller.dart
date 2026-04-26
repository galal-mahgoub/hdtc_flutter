import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/use_cases/send_forgot_password_code_use_case.dart';

class SendForgotPasswordController extends GetxController {
  SendForgotPasswordCodeUseCase sendForgotPasswordCodeUseCase;
  SendForgotPasswordController({required this.sendForgotPasswordCodeUseCase});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();

  bool isLoading = false;

  Future<void> sendCode() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading = true;
    update();

    var result = await sendForgotPasswordCodeUseCase(
      email: emailCtrl.text,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      isLoading = false;
      update();
      Get.back();
      ToastManager.showSuccess('CheckMail'.tr + emailCtrl.text);
    });
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    super.onClose();
  }
}
