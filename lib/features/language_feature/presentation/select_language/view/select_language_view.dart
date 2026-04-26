import 'package:hdtc_on/core/theme/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/consts/assets.dart';
import '../../../../../core/consts/enums.dart';
import '../../../../../core/languages/app_translations.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../controllers/select_language_controller.dart';
import 'components/language_card.dart';

class SelectLanguageView extends StatelessWidget {
  const SelectLanguageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectLanguageController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ).r,
            child: CustomButton(
              isLoading: controller.isLoading,
              onPressed: () => Get.toNamed(Routes.login),
              width: context.width.w,
              text: LocaleKeys.continuee.tr,
            ),
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 32,
              ).r,
              children: [
                /// Title
                Text(
                  LocaleKeys.selectLangTitle.tr,
                  style: TextManager.font24Text300W600,
                ),
                8.verticalSpace,

                /// Desc
                Text(
                  LocaleKeys.selectLangDesc.tr,
                  style: TextManager.font14Text100W400,
                ),
                32.verticalSpace,

                /// Arabic
                LangaugeCard(
                  isSelected: controller.savedLang == Language.ar,
                  onSelectLangTap: () =>
                      controller.onChangeLang(lang: Language.ar.name),
                  text: LocaleKeys.arabic.tr,
                  icon: Assets.aeFlagIcon,
                ),
                16.verticalSpace,

                /// English
                LangaugeCard(
                  isSelected: controller.savedLang == Language.en,
                  onSelectLangTap: () =>
                      controller.onChangeLang(lang: Language.en.name),
                  text: LocaleKeys.english.tr,
                  icon: Assets.gbFlagIcon,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
