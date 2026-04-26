import 'package:hdtc_on/features/provider_feature/domain/entities/reservation.dart';
import 'package:hdtc_on/features/provider_feature/domain/use_cases/get_meetings_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';

class MeetingController extends GetxController {
  GetMeetingsUseCase getMeetingsUseCase;
  MeetingController({
    required this.getMeetingsUseCase,
  });

  static MeetingController get to => Get.find();

  late PageController pageController;

  int currentIndex = 0;

  bool isLoading = false;
  Reservation? reservation;

  changeViewIndex(int value) {
    currentIndex = value;
    pageController.animateToPage(
      value,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
    update();
  }

  Future<void> getMeetings() async {
    isLoading = true;
    update();

    var result = await getMeetingsUseCase();

    result.fold((failure) {
      isLoading = false;
      update();

      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      reservation = result;

      isLoading = false;
      update();
    });
  }

  @override
  Future<void> onInit() async {
    pageController = PageController();

    await getMeetings();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
