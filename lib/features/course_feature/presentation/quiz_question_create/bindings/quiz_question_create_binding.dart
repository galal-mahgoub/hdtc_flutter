import 'package:get/get.dart';

import '../../../domain/use_cases/store_result_use_case.dart';
import '../controllers/quiz_question_create_controller.dart';

class QuizDetailsQuestionCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => StoreResultUseCase(
        baseCourseRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut<QuizQuestionCreateController>(
      () => QuizQuestionCreateController(
        storeResultUseCase: Get.find(),
      ),
    );
  }
}
