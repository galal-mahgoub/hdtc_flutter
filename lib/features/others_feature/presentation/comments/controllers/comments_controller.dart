import 'package:hdtc_on/features/others_feature/domain/use_cases/get_comments_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/comments_respone.dart';

class CommentsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  GetCommentsUseCase getCommentsUseCase;
  CommentsController({required this.getCommentsUseCase});

  late PageController pageController;
  int currentIndex = 0;

  bool isLoading = false;
  CommentRespone? comment;

  changeViewIndex(int value) {
    currentIndex = value;
    pageController.animateToPage(
      value,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
    update();
  }

  Future<void> getComments() async {
    isLoading = true;
    update();
    var result = await getCommentsUseCase();

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      comment = result;
      isLoading = false;
      update();
    });
  }

  @override
  Future<void> onInit() async {
    pageController = PageController();

    await getComments();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
