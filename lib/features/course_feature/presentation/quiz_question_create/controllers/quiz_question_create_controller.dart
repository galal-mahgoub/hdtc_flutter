import 'package:dartz/dartz.dart';
import 'package:hdtc_on/core/errors/failures.dart';
import 'package:hdtc_on/core/routes/app_pages.dart';
import 'package:hdtc_on/features/course_feature/domain/entities/start_quiz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/store_result_use_case.dart';

import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/question_store.dart';
import '../../../domain/entities/quiz.dart';
import '../../../domain/entities/result.dart';

class QuizQuestionCreateController extends GetxController {
  StoreResultUseCase storeResultUseCase;
  QuizQuestionCreateController({
    required this.storeResultUseCase,
  });

  PageController pageController = PageController();

  bool isStoreLoading = false;
  int indexQuestion = 1;
  double valueOfProgressBarQuestion = 1.0;
  String typeQuestion = '';
  int quizResultId = 0;

  StartQuiz? startQuiz;
  Quiz? quiz;
  Result? result;

  List<QuestionStore> questionStore = [];

  Future<void> storeResult({bool isDialog = false}) async {
    if (questionStore.isEmpty && !isDialog) {
      ToastManager.showError("selectAnswer".tr);
      return;
    }
    isStoreLoading = true;
    update();
    Either<Failure, Result> store;
    if (typeQuestion == 'Result') {
      store = await storeResultUseCase(
        quizId: result!.quiz!.id.toString(),
        quizResultId: result!.id,
        answers:
            questionStore.where((element) => element.value.isNotEmpty).toList(),
      );
    } else {
      store = await storeResultUseCase(
        quizId: quiz!.id.toString(),
        quizResultId: quizResultId.toString(),
        answers:
            questionStore.where((element) => element.value.isNotEmpty).toList(),
      );
    }

    store.fold((failure) {
      isStoreLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      isStoreLoading = false;
      update();

      Utils.getBackUntilMain(stopRoute: Routes.courseDetails, result: result);

      ToastManager.showSuccess("answerStoreSuccess".tr);
    });
  }

  void handleTimerOnEnd() async {
    if (result?.quiz?.time != '0' || quiz?.time != '0') {
      await storeResult();
    }
  }

  void timerValueChangeListener(Duration timeElapsed) {
    // Get.log("timerValueChangeListener*******$timeElapsed");
  }
  void refreshProgressQuestion() {
    if (typeQuestion == 'Result') {
      valueOfProgressBarQuestion =
          (1.0 / result!.quiz!.questions.length) * indexQuestion;
    } else {
      valueOfProgressBarQuestion =
          (1.0 / quiz!.questions.length) * indexQuestion;
    }
    update();
  }

  @override
  void onInit() {
    quiz = Get.arguments['quizParticipatedDetails'];
    result = Get.arguments['quizResultDetails'];
    typeQuestion = Get.arguments['type'] ?? '';
    quizResultId = Get.arguments['quizResultId'] ?? 0;
    if (typeQuestion == 'Result') {
      valueOfProgressBarQuestion =
          (1.0 / (result?.quiz?.questions ?? []).length).isFinite
              ? (1.0 / (result?.quiz?.questions ?? []).length) * indexQuestion
              : 0.0;

      for (var element in (result?.quiz?.questions ?? [])) {
        questionStore.add(
          QuestionStore(
            idQuestion: element.id,
            grade: element.grade,
            index: -1,
          ),
        );
      }
    } else {
      (1.0 / (quiz?.questions ?? []).length).isFinite
          ? valueOfProgressBarQuestion =
              (1.0 / (quiz?.questions ?? []).length) * indexQuestion
          : 0.0;

      for (var element in (quiz?.questions ?? [])) {
        questionStore.add(
          QuestionStore(
            idQuestion: element.id,
            grade: element.grade,
            index: -1,
          ),
        );
      }
    }

    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
