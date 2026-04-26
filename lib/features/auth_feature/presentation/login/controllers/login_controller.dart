import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/consts/k_strings.dart';
import '../../../../../core/services/user_service.dart';
import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/use_cases/login_use_case.dart';

class LoginController extends GetxController {
  LoginUseCase loginUseCase;

  LoginController({
    required this.loginUseCase,
  });

  CountryCode countryCode = CountryCode.fromDialCode(Kstrings.countryCode);

  setCountry(CountryCode country) {
    if (countryCode != country) {
      countryCode = country;
      update();
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailCtrl;
  late TextEditingController passwordCtrl;

  bool isLoading = false;

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading = true;
    update();

    var result = await loginUseCase(
      email: emailCtrl.text,
      password: passwordCtrl.text,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      isLoading = false;
      update();
      UserService.to.currentUser.value = result;

      Get.back(result: true, closeOverlays: true);
    });
  }

  @override
  void onInit() {
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.onClose();
  }
}
