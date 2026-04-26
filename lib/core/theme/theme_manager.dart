import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

class CustomTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: ColorManager.green3,
      
      fontFamily: FontConstants.enFontFamily,
      useMaterial3: true,
      scaffoldBackgroundColor: ColorManager.white13,
      appBarTheme: const AppBarTheme(
        toolbarHeight: 80,
        color: ColorManager.white13,
        shape: Border(
          bottom: BorderSide(
            color: ColorManager.grey2,
          ),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.green,
        selectionColor: ColorManager.green.withOpacity(.5),
        selectionHandleColor: ColorManager.green,
      ),
    );
  }

  static ThemeData get ksaTheme {
    return ThemeData(
      primaryColor: ColorManager.greenColor,
      fontFamily: FontConstants.enFontFamily,
      useMaterial3: true,
      scaffoldBackgroundColor: ColorManager.white13,
      appBarTheme: const AppBarTheme(
        toolbarHeight: 80,
        color: ColorManager.white13,
        shape: Border(
          bottom: BorderSide(
            color: ColorManager.grey2,
          ),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.greenColor,
        selectionColor: ColorManager.greenColor.withOpacity(.5),
        selectionHandleColor: ColorManager.greenColor,
      ),
    );
  }
}
