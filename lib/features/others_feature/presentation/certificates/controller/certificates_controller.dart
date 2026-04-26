import 'package:hdtc_on/features/others_feature/domain/use_cases/get_class_certificates_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/get_completion_certificates_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/services/user_service.dart';
import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/certificate.dart';

class CertificatesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  GetCompletionCertificatesUseCase getCompletionCertificatesUseCase;
  GetClassCertificatesUseCase getClassCertificatesUseCase;
  CertificatesController({
    required this.getCompletionCertificatesUseCase,
    required this.getClassCertificatesUseCase,
  });
  late PageController pageController;
  int currentIndex = 0;

  bool isLoading = false;
  List<Certificate> completionCertificates = [];
  List<Certificate> classCertificates = [];

  changeViewIndex(int value) {
    currentIndex = value;
    pageController.animateToPage(
      value,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
    update();
  }

  Future<void> getCompletionCertificates() async {
    isLoading = true;
    update();
    var result = await getCompletionCertificatesUseCase();
   
    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      completionCertificates = result;
      isLoading = false;
      update();
    });
  }

  Future<void> getClassCertificates() async {
    isLoading = true;
    update();
    var result = await getClassCertificatesUseCase();

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      classCertificates = result;
      isLoading = false;
      update();
    });
  }

  @override
  Future<void> onInit() async {
    pageController = PageController();

    if (UserService.to.currentUser.value!.roleName == 'user') {
      await Future.wait([
        getCompletionCertificates(),
      ]);
    } else {
      await Future.wait([
        getCompletionCertificates(),
        getClassCertificates(),
      ]);
    }
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
