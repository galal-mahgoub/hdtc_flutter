import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/features/provider_feature/presentation/providers/controllers/providers_controller.dart';

import '../../../../category_feature/presentation/categories/view/categories_view.dart';
import '../../../../course_feature/presentation/my_courses/views/my_courses_view.dart';
import '../../../../provider_feature/presentation/providers/views/providers_view.dart';
import '../../home/views/home_view.dart';
import '../../settings/views/settings_view.dart';

class MainLayoutController extends GetxController {
  static MainLayoutController get to => Get.find();

  int currentIndex = 2;
  bool isLoading = false;

  List<Widget> pages = [
    const CategoriesView(),
    const ProvidersView(),
    const HomeView(),
    const MyCoursesView(),
    const SettingsView(),
  ];

  changeIndex(int value, {bool isShowConsultant = false}) {
    currentIndex = value;
    if (isShowConsultant) {
      Future.delayed(const Duration(milliseconds: 200), () {
        ProvidersController.to.changeViewIndex(1);
      });
    }
    update();
  }
}
