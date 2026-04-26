import 'package:hdtc_on/features/provider_feature/domain/use_cases/business_consultations_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../category_feature/domain/entities/category.dart';
import '../../../../category_feature/domain/use_cases/get_all_categories_use_case.dart';
import '../../../domain/entities/provider.dart';
import '../../../domain/use_cases/instructors_use_case.dart';

class ProvidersController extends GetxController {
  InstructorsUseCase instructorsUseCase;
  BusinessConsultationsUseCase businessConsultationsUseCase;
  GetAllCategoriesUseCase getAllCategoriesUseCase;

  ProvidersController({
    required this.instructorsUseCase,
    required this.businessConsultationsUseCase,
    required this.getAllCategoriesUseCase,
  });

  static ProvidersController get to => Get.find();

  late PageController pageController;
  int currentIndex = 0;
  bool switchAvailableMeetings = false;
  bool switchFreeMeetings = false;
  bool switchDiscount = false;
  bool switchDownloadable = false;
  String instructorsSortBy = '';
  String businessConsultantsSortBy = '';

  List<Provider> instructors = [];
  List<Provider> consultants = [];
  List<Category> categories = [];
  List<String> selectedCategories = [];
  bool isInstructorsLoading = true;
  bool isCategoriesLoading = false;
  bool isConsultantsLoading = true;

  selectCategory(String value) {
    if (selectedCategories.contains(value)) {
      selectedCategories.remove(value);
    } else {
      selectedCategories.add(value);
    }
    update();
  }

  changeViewIndex(int value) {
    currentIndex = value;
    pageController.animateToPage(
      value,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
    update();
  }

  changeInstructorSortBy(String value) {
    instructorsSortBy = value;
    update();
  }

  changeBusinessConsultantsSortBy(String value) {
    businessConsultantsSortBy = value;
    update();
  }

  Future<void> getInstructors() async {
    isInstructorsLoading = true;
    update();
    var result = await instructorsUseCase(
      categories: selectedCategories,
      sort: instructorsSortBy,
    );

    result.fold((failure) {
      isInstructorsLoading = false;
      update();
      Utils.mapFailureToMessage(failure);
    }, (result) {
      instructors = result;
      isInstructorsLoading = false;
      update();
    });
  }

  Future<void> getCategories() async {
    isCategoriesLoading = true;
    update();

    var result = await getAllCategoriesUseCase();

    result.fold((failure) {
      isCategoriesLoading = false;
      update();
      Utils.mapFailureToMessage(failure);
    }, (result) {
      categories = result;
      isCategoriesLoading = false;
      update();
    });
  }

  Future<void> getBusinessConsultations() async {
    isConsultantsLoading = true;
    update();

    var result = await businessConsultationsUseCase(
      availableMeetings: switchAvailableMeetings ? 1 : 0,
      freeMeetings: switchFreeMeetings ? 1 : 0,
      discount: switchDiscount ? 1 : 0,
      downloadable: switchDownloadable ? 1 : 0,
      sort: businessConsultantsSortBy,
    );

    result.fold((failure) {
      isConsultantsLoading = false;
      update();
      Utils.mapFailureToMessage(failure);
    }, (result) {
      consultants = result;

      isConsultantsLoading = false;
      update();
    });
  }

  @override
  void onInit() async {
    pageController = PageController();

    await Future.wait([
      getInstructors(),
      getBusinessConsultations(),
      getCategories(),
    ]);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();

    super.onClose();
  }
}
