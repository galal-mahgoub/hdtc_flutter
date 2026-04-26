import 'package:hdtc_on/core/services/user_service.dart';
import 'package:hdtc_on/core/utils/toast_manager.dart';
import 'package:hdtc_on/features/provider_feature/domain/entities/provider.dart';
import 'package:hdtc_on/features/provider_feature/domain/use_cases/create_meeting_use_case.dart';
import 'package:hdtc_on/features/provider_feature/domain/use_cases/follow_provider_use_case.dart';
import 'package:hdtc_on/features/provider_feature/domain/use_cases/get_consultant_meetings_date_use_case.dart';
import 'package:hdtc_on/features/provider_feature/domain/use_cases/provider_info_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/follower.dart';
import '../../../domain/entities/time.dart';

class InstructorDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  ProviderInfoUseCase providerInfoUseCase;
  FollowProviderUseCase followProviderUseCase;
  GetConsultantMeetingsUseCase getConsultantMeetingsUseCase;
  CreateMeetingUseCase createMeetingUseCase;

  InstructorDetailsController({
    required this.providerInfoUseCase,
    required this.followProviderUseCase,
    required this.getConsultantMeetingsUseCase,
    required this.createMeetingUseCase,
  });

  late PageController pageController;

  bool isLoading = true;
  bool isFollowLoading = false;

  int currentIndex = 0;
  Provider? provider;
  Time? selectedTime;

// Calender Bottomsheet
  TextEditingController descCtrl = TextEditingController();
  String startDate = DateFormat("dd MMM yyyy").format(DateTime.now());
  String countMeeting = 'No';
  bool isConsultantDatesLoading = false;
  bool isCreatingMeeting = false;
  String conductionType = 'online';
  String meetingType = 'individual';
  List<Time> times = [];

  changeIndex(int value) {
    currentIndex = value;
    pageController.animateToPage(
      value,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
    update();
  }

  selectPickUpTime(int index) {
    if (times[index].canReserve) {
      selectedTime = times[index];
      update();
    } else {
      ToastManager.showError(
        'TimeAlreadyReserved'.tr,
      );
    }
  }

  void onSelectionCalendarChanged(
      DateRangePickerSelectionChangedArgs args) async {
    startDate = DateFormat("dd MMM yyyy").format(args.value);

    await getMeetingDetailsOfDate();
  }

  Future<void> createMeeting() async {
    if (selectedTime == null) return;
    isCreatingMeeting = true;
    update();

    var result = await createMeetingUseCase(
      timeId: selectedTime!.id.toString(),
      date: DateFormat("yyyy-MM-dd")
          .format(DateFormat("dd MMM yyyy").parse(startDate)),
      description: descCtrl.text,
      meetingType: conductionType,
    );

    result.fold((failure) {
      isCreatingMeeting = false;
      update();

      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      if (Get.isBottomSheetOpen!) {
        Get.back(closeOverlays: true);
      }

      isCreatingMeeting = false;
      update();
    });
  }

  Future<void> getMeetingDetailsOfDate() async {
    selectedTime = null;
    isConsultantDatesLoading = true;
    update();

    var result = await getConsultantMeetingsUseCase(
      providerId: provider!.id,
      date: startDate,
    );

    result.fold((failure) {
      isConsultantDatesLoading = false;
      update();

      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      times = result;
      isConsultantDatesLoading = false;
      update();
    });
  }

  Future<void> getInstructorInfo() async {
    var result = await providerInfoUseCase(
      providerId: provider!.id,
    );

    result.fold((failure) {
      isLoading = false;
      update();

      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      provider = result;

      isLoading = false;
      update();
    });
  }

  Future<void> followInstructor() async {
    if (isFollowLoading) return;
    isFollowLoading = true;
    update();

    var result = await followProviderUseCase(
      providerId: provider!.id,
      status: !provider!.followers
          .where(
              (element) => element.id == UserService.to.currentUser.value?.id)
          .isNotEmpty,
    );

    result.fold((failure) {
      isFollowLoading = false;
      update();

      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      if (provider!.followers
          .where(
              (element) => element.id == UserService.to.currentUser.value?.id)
          .isNotEmpty) {
        provider!.followersCount = (provider!.followersCount ?? 0) - 1;

        provider!.followers.removeWhere(
            (element) => element.id == UserService.to.currentUser.value?.id);
      } else {
        provider!.followersCount = (provider!.followersCount ?? 0) + 1;
        provider!.followers = [
          ...provider!.followers,
          Follower(id: UserService.to.currentUser.value?.id)
        ];
      }
      isFollowLoading = false;
      update();
    });
  }

  @override
  void onInit() async {
    pageController = PageController();

    if (Get.arguments != null) {
      provider = Get.arguments;
      await getInstructorInfo();
    } else {
      Get.back();
    }

    super.onInit();
  }

  @override
  void onClose() {
    descCtrl.dispose();
    pageController.dispose();
    super.onClose();
  }
}
