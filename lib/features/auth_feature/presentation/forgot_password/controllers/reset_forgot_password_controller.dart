import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/consts/k_strings.dart';
import '../../../domain/use_cases/reset_forgot_password_use_case.dart';

class ResetForgotPasswordController extends GetxController {
  ResetForgotPasswordUseCase resetForgotPasswordUseCase;
  ResetForgotPasswordController({required this.resetForgotPasswordUseCase});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController codeCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPassCtrl = TextEditingController();

  bool isLoading = false;
  String token = '';

  CountryCode countryCode = CountryCode.fromDialCode(Kstrings.countryCode);

  Future<void> resetPassword() async {
    // if (!formKey.currentState!.validate()) {
    //   return;
    // }

    // isLoading = true;
    // update();

    // var result = await resetForgotPasswordUseCase(
    //   email: emailCtrl.text,
    //   token: token,
    //   pass: passwordCtrl.text,
    //   confirmPass: confirmPassCtrl.text,
    // );

    // result.fold((failure) {
    //   isLoading = false;
    //   update();
    //   ToastManager.showError(Utils.mapFailureToMessage(failure));
    // }, (result) {
    //   isLoading = false;
    //   update();
    //   Utils.getBackUntilMain(stopRoute: Routes.login);

    //   ToastManager.showSuccess(result);
    // });
  }

  @override
  void onInit() {
    countryCode = CountryCode.fromDialCode(
        Get.arguments?['countryCode'] ?? Kstrings.countryCode);
    emailCtrl.text = Get.arguments?['email'] ?? '';
    token = Get.arguments?['token'] ?? '';
    super.onInit();
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    codeCtrl.dispose();
    passwordCtrl.dispose();
    confirmPassCtrl.dispose();
    super.onClose();
  }
}
