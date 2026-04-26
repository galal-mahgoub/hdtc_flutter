import 'package:hdtc_on/features/others_feature/domain/use_cases/check_subscription_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/get_subscribes_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/get_summerys_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/subscribe_respone.dart';
import '../../../domain/entities/summery.dart';

class SubscribesController extends SuperController {
  GetSubscribesUseCase getSubscribesUseCase;
  GetSummaryUseCase getSummaryUseCase;
  CheckSubscriptionUseCase checkSubscriptionUseCase;
  SubscribesController({
    required this.getSubscribesUseCase,
    required this.getSummaryUseCase,
    required this.checkSubscriptionUseCase,
  });

  static SubscribesController get to => Get.find();

  late PageController pageController;
  int currentIndex = 0;
  int subscribePlanIndex = 0;
  bool isLoading = false;
  String isCheckLoading = '';
  SubscriptionRespone? subscriptionRespone;
  Summery? summery;

  bool isCancelSubscribeLoading = false;

  changeViewIndex(int value) {
    currentIndex = value;
    pageController.animateToPage(
      value,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
    update();
  }

  Future<void> getSubscribes() async {
    isLoading = true;
    update();
    var result = await getSubscribesUseCase();

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      subscriptionRespone = result;
      isLoading = false;
      update();
    });
  }

  Future<void> getSummary() async {
    isLoading = true;
    update();
    var result = await getSummaryUseCase();

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      summery = result;
      isLoading = false;
      update();
    });
  }

  Future<void> checkoutSubscription(String id) async {
    isCheckLoading = id;
    update();

    var result = await checkSubscriptionUseCase(subscribeId: id);

    result.fold((failure) {
      isCheckLoading = '';
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      isCheckLoading = '';
      update();
      Get.toNamed(
        Routes.webView,
        arguments: {'url': result},
      );
    });
  }

  @override
  Future<void> onInit() async {
    pageController = PageController();

    await Future.wait([
      getSubscribes(),
      getSummary(),
    ]);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  @override
  void onDetached() {}

  @override
  void onHidden() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() async {
    Get.log("onResumedSubscribe");
    await Future.wait([
      getSubscribes(),
      getSummary(),
    ]);
  }
}
