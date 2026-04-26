import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/consts/enums.dart';
import '../../../../../core/languages/app_translations.dart';
import '../../../../../core/services/language_service.dart';
import '../../../../../core/services/user_service.dart';
import '../../../../../core/utils/toast_manager.dart';
import '../../../../language_feature/domain/use_cases/save_language_use_case.dart';
import '../../../domain/use_cases/logout_use_case.dart';

class SettingsController extends GetxController {
  LogoutUserUseCase logoutUserUseCase;
  SaveLanguageUseCase saveLanguageUseCase;
  SettingsController({
    required this.logoutUserUseCase,
    required this.saveLanguageUseCase,
  });
  bool isLoading = false;
  Language savedLang = Language.en;

 

  Future<void> logout() async {
    isLoading = true;
    update();
    UserService.to.currentUser.value = null;
    if (Get.isDialogOpen!) {
      Get.back();
    }
    ToastManager.showSuccess(LocaleKeys.logoutSuccess.tr);

    var result = await logoutUserUseCase();

    result.fold((failure) {
      isLoading = false;
      update();
    }, (result) async {
      isLoading = false;
      update();
    });
  }

  Future<void> onChangeLang({required String lang}) async {
    Get.updateLocale(Locale(lang));
    savedLang = checkLanguage(lang);
    LanguageService.to.savedLang.value = savedLang;
    update();

    if (Get.isDialogOpen!) {
      Get.back();
    }
    var saveLang = await saveLanguageUseCase(lang: lang);

    saveLang.fold(
      (l) {},
      (r) {},
    );
  }

  

  @override
  void onInit() async {
    savedLang = LanguageService.to.savedLang.value;

    super.onInit();
  }
}
