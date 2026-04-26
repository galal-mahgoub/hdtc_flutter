import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/use_cases/send_forgot_password_code_use_case.dart';
import '../../../domain/use_cases/verify_forgot_password_code_use_case.dart';

class VerifyForgotPasswordController extends GetxController {
  SendForgotPasswordCodeUseCase sendForgotPasswordCodeUseCase;
  VerifyForgotPasswordCodeUseCase verifyForgotPasswordCodeUseCase;
  VerifyForgotPasswordController({
    required this.sendForgotPasswordCodeUseCase,
    required this.verifyForgotPasswordCodeUseCase,
  });

  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController codeCtrl = TextEditingController();

  bool isLoading = false;

  late Timer timer;
  int timeCounter = 60;

  Future<void> verifyCode() async {
    if (!formKey.currentState!.validate()) {
      errorController.add(ErrorAnimationType.shake);
      return;
    }

    isLoading = true;
    update();

    var result = await verifyForgotPasswordCodeUseCase(
      email: emailCtrl.text,
      code: codeCtrl.text,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      isLoading = false;
      update();

    Get.offAndToNamed(
      Routes.resetForgotPassword,
      arguments: {
        'email': emailCtrl.text,
        'code': codeCtrl.text,
      },
    );
    });
  }

  Future<void> resendCode() async {
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
      codeCtrl.clear();
    startResendTimerCountDown();
    });
  }

  /// SET RESEND OTP TIMER
  startResendTimerCountDown() {
    timeCounter = 60;

    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (timeCounter == 0) {
          timer.cancel();
        } else {
          timeCounter--;
        }
        update();
      },
    );
  }

  @override
  void onInit() {
    emailCtrl.text = Get.arguments?['email'] ?? '';
    startResendTimerCountDown();
    super.onInit();
  }

  @override
  void onClose() {
    errorController.close();
    timer.cancel();
    emailCtrl.dispose();
    codeCtrl.dispose();
    super.onClose();
  }
}
