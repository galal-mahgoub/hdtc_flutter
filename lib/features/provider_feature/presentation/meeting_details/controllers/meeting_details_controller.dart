import 'package:hdtc_on/features/provider_feature/domain/use_cases/create_meeting_link_use_case.dart';
import 'package:hdtc_on/features/provider_feature/domain/use_cases/finish_meeting_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/reservation.dart';

class MeetingDetailsController extends GetxController {
  FinishMeetingUseCase finishMeetingUseCase;
  CreateMeetingLinkUseCase createMeetingLinkUseCase;
  MeetingDetailsController({
    required this.finishMeetingUseCase,
    required this.createMeetingLinkUseCase,
  });

  TextEditingController urlController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> formCreateLink = GlobalKey<FormState>();

  bool isLoading = true;
  bool isPasswordLogin = true;
  bool isFinishMeetingLoading = false;
  bool isCreateLinkLoading = true;

  Meeting? item;

  Future<void> finishMeeting() async {
    isFinishMeetingLoading = true;
    update();

    var result = await finishMeetingUseCase(
      meetingId: item!.id.toString(),
    );

    result.fold((failure) {
      isFinishMeetingLoading = false;
      update();

      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      if (Get.isBottomSheetOpen!) {
        Get.back(closeOverlays: true);
      }

      isFinishMeetingLoading = false;
      update();
    });
  }

  Future<void> createLink() async {
    if (!formCreateLink.currentState!.validate()) {
      return;
    }
    isCreateLinkLoading = true;
    update();

    var result = await createMeetingLinkUseCase(
      meetingId: item!.id.toString(),
      link: urlController.text.toString(),
      pass: passController.text.isEmpty ? null : passController.text,
    );

    result.fold((failure) {
      isCreateLinkLoading = false;
      update();

      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      if (Get.isBottomSheetOpen!) {
        Get.back(closeOverlays: true);
      }

      isCreateLinkLoading = false;
      update();
    });
  }

  @override
  Future<void> onInit() async {
    item = Get.arguments['meetingDetails'];
    isLoading = false;
    update();

    super.onInit();
  }

  @override
  void onClose() {
    urlController.dispose();
    passController.dispose();
    super.onClose();
  }
}
