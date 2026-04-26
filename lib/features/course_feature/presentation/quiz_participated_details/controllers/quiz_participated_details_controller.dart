import 'package:hdtc_on/core/routes/app_pages.dart';
import 'package:hdtc_on/core/utils/toast_manager.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/start_quiz_use_case.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/quiz.dart';

class QuizParticipatedDetailsController extends GetxController {
  StartQuizUseCase startQuizUseCase;
  QuizParticipatedDetailsController({required this.startQuizUseCase});
  Quiz? quiz;

  bool isStartingQuiz = false;

  Future<void> startQuiz() async {
    isStartingQuiz = true;
    update();

    var result = await startQuizUseCase(
      quizId: quiz!.id.toString(),
    );

    result.fold((failure) {
      isStartingQuiz = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      isStartingQuiz = false;
      update();
      Get.toNamed(Routes.quizDetailsQuestionCreate, arguments: {
        'quizParticipatedDetails': result.quiz,
        'quizResultId': result.quizResultId,
      });
    });
  }

  @override
  void onInit() {
    quiz = Get.arguments['quizParticipatedDetails'];
    Get.log("quizId==>${quiz?.id}");
    super.onInit();
  }
}
