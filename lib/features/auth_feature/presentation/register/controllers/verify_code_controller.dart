import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/languages/app_translations.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/services/user_service.dart';
import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/use_cases/resend_verify_code_use_case.dart';
import '../../../domain/use_cases/verify_code_use_case.dart';

class VerifyCodeController extends GetxController {
  VerifyCodeUseCase verifyCodeUseCase;
  ResendVerifyCodeUseCase resendVerifyCodeUseCase;

  VerifyCodeController({
    required this.verifyCodeUseCase,
    required this.resendVerifyCodeUseCase,
  });

  late StreamController<ErrorAnimationType> errorController;
  late GlobalKey<FormState> formKey;
  late TextEditingController codeCtrl;
  late TextEditingController emailCtrl;

  Timer? timer;
  int timeCounter = 60;
  bool isLoading = false;
  late String verId;

  Future<void> verifyCode() async {
    if (!formKey.currentState!.validate()) {
      errorController.add(ErrorAnimationType.shake);
      return;
    }

    isLoading = true;
    update();

    var result = await verifyCodeUseCase(
      code: codeCtrl.text,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      isLoading = false;
      update();

      UserService.to.currentUser.value = result;

      Utils.getBackUntilMain(stopRoute: Routes.mainlayout);
    });
  }

  Future<void> resendCode() async {
    isLoading = true;
    update();

    var result = await resendVerifyCodeUseCase();

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      isLoading = false;
      update();
      ToastManager.showSuccess(LocaleKeys.verifyCodeSent.tr);

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
  void onInit() async {
    formKey = GlobalKey<FormState>();
    errorController = StreamController<ErrorAnimationType>();
    codeCtrl = TextEditingController();
    emailCtrl = TextEditingController();

    emailCtrl.text = '${UserService.to.currentUser.value?.email}';

    if (Get.arguments != null) {
      await resendCode();
    } else {
      startResendTimerCountDown();
    }

    super.onInit();
  }

  @override
  void onClose() {
    if (timer != null) {
      timer?.cancel();
    }
    errorController.close();
    codeCtrl.dispose();
    emailCtrl.dispose();
    super.onClose();
  }
}
