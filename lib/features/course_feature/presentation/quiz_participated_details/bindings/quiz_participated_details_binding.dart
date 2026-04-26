import 'package:get/get.dart';

import '../../../domain/use_cases/start_quiz_use_case.dart';
import '../controllers/quiz_participated_details_controller.dart';

class QuizParticipatedDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StartQuizUseCase(
        baseCourseRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut<QuizParticipatedDetailsController>(
      () => QuizParticipatedDetailsController(
        startQuizUseCase: Get.find(),
      ),
    );
  }
}
