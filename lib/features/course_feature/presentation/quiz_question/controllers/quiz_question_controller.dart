import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/result.dart';

class QuizQuestionController extends GetxController {
  PageController pageController = PageController();

  Result? result;

  double valueOfProgressBarQuestion = 1.0;
  int indexQuestion = 1;

  void refreshProgressQuestion() {
    valueOfProgressBarQuestion =
        (1.0 / result!.quiz!.questions.length) * indexQuestion;
    update();
  }

  @override
  Future<void> onInit() async {
    result = Get.arguments?['quizResultDetails'];

    (1.0 / result!.quiz!.questions.length).isFinite
        ? valueOfProgressBarQuestion =
            (1.0 / result!.quiz!.questions.length) * indexQuestion
        : 0.0;

    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
