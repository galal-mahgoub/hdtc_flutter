import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/services/user_service.dart';

import 'core/consts/enums.dart';
import 'core/consts/k_strings.dart';
import 'core/languages/app_translations.dart';
import 'core/routes/app_pages.dart';
import 'core/services/firebase_messaging_service.dart';
import 'core/services/language_service.dart';
import 'core/theme/theme_manager.dart';
import 'injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ScreenUtilInit(
        designSize: const Size(360, 690),
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        child: MediaQuery(
          data: MediaQueryData.fromView(View.of(context)).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: GetMaterialApp(
            title: Kstrings.projectName,
            translationsKeys: AppTranslation.translations,
            locale: Locale(LanguageService.to.savedLang.value.name),
            fallbackLocale: Locale(Language.en.name),
            supportedLocales: [
              Locale(Language.en.name),
              Locale(Language.ar.name),
            ],
            onReady: () async {
              await Get.putAsync(
                () => FireBaseMessagingService().init(),
              );
            },
            localizationsDelegates: const [
              CountryLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: UserService.to.isKsa.value
                ? CustomTheme.ksaTheme
                : CustomTheme.theme,
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
          ),
        ),
      );
    });
  }
}
