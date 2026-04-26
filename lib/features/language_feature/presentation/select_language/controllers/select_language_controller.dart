import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/consts/enums.dart';
import '../../../../../core/services/language_service.dart';
import '../../../domain/use_cases/get_language_use_case.dart';
import '../../../domain/use_cases/save_language_use_case.dart';

class SelectLanguageController extends GetxController {
  GetLanguageUseCase getLanguageUseCase;
  SaveLanguageUseCase saveLanguageUseCase;
  SelectLanguageController({
    required this.getLanguageUseCase,
    required this.saveLanguageUseCase,
  });

  bool isLoading = false;

  Language savedLang = Language.en;

  Future<void> onChangeLang({required String lang}) async {
    Get.updateLocale(Locale(lang));
    savedLang = checkLanguage(lang);
    update();
    LanguageService.to.savedLang.value = savedLang;
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
