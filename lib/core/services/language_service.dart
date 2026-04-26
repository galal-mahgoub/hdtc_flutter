import 'package:get/get.dart';

import '../../features/language_feature/domain/use_cases/get_language_use_case.dart';
import '../consts/enums.dart';
import '../utils/utils.dart';

class LanguageService extends GetxService {
  GetLanguageUseCase getLanguageUseCase;

  LanguageService({
    required this.getLanguageUseCase,
  });

  static LanguageService get to => Get.find();

  Rx<Language> savedLang = Rx(Language.en);

  Future<LanguageService> init() async {
    await Future.wait([
      getLang(),
    ]);
    return this;
  }

  Future<void> getLang() async {
    var getLang = await getLanguageUseCase();

    getLang.fold(
      (failure) {
        Utils.mapFailureToMessage(failure);
      },
      (result) {
        savedLang.value = checkLanguage(result);
      },
    );
  }
}
