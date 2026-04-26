import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/consts/k_strings.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/use_cases/register_use_case.dart';

class RegisterController extends GetxController {
  RegisterUseCase registerUseCase;
  RegisterController({
    required this.registerUseCase,
  });

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> mobileFormKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPassCtrl = TextEditingController();


  CountryCode countryCode = CountryCode.fromDialCode(Kstrings.countryCode);

  setCountry(CountryCode country) {
    if (countryCode != country) {
      countryCode = country;
      update();
    }
  }

  bool isLoading = false;

  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading = true;
    update();

    var result = await registerUseCase(
      countryCode: countryCode.dialCode ?? Kstrings.countryCode,
      name: nameCtrl.text,
      mobile: phoneCtrl.text,
      email: emailCtrl.text,
      password: passwordCtrl.text,
      passwordConfirmation: confirmPassCtrl.text,
    );

    result.fold((failure) {
      isLoading = false;
      update();

      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      isLoading = false;
      update();

      Get.offAndToNamed(Routes.verifyCode);
    });
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    passwordCtrl.dispose();
    confirmPassCtrl.dispose();

    super.onClose();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    passwordCtrl.dispose();
    confirmPassCtrl.dispose();

    super.dispose();
  }
}
