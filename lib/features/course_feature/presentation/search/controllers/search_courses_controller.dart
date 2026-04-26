import 'package:hdtc_on/features/course_feature/domain/use_cases/search_courses_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';

import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/course.dart';
import '../../../domain/use_cases/courses_use_case.dart';

class SearchCoursesController extends GetxController {
  CoursesUseCase coursesUseCase;
  SearchCoursesUseCase searchCoursesUseCase;
  SearchCoursesController({
    required this.coursesUseCase,
    required this.searchCoursesUseCase,
  });

  GlobalKey formSearch = GlobalKey<FormState>();
  TextEditingController searchCtrl = TextEditingController();

  final debouncer = Debouncer(delay: const Duration(milliseconds: 500));
  bool isLoading = false;

  List<Course> suggestedCourses = [];
  List<Course> searchedCourses = [];

  Future<void> getSuggestedCourses() async {
    isLoading = true;
    update();

    var result = await coursesUseCase(
      sort: 'best_rates',
      offset: '0',
      limit: '6',
    );

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      suggestedCourses = result;
      isLoading = false;
      update();
    });
  }

  Future<void> searchCourses() async {
    if (searchCtrl.text.isEmpty) {
      searchedCourses.clear();
      update();
      return;
    }
    isLoading = true;
    update();

    var result = await searchCoursesUseCase(
      search: searchCtrl.text,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      searchedCourses = result;
      isLoading = false;

      update();
    });
  }

  @override
  void onInit() async {
    await getSuggestedCourses();
    super.onInit();
  }

  @override
  void onClose() {
    searchCtrl.dispose();
    debouncer.cancel();
    super.onClose();
  }
}
