import 'package:get/get.dart';

import '../../../domain/use_cases/add_question_use_case.dart';
import '../../../domain/use_cases/edit_question_use_case.dart';
import '../../../domain/use_cases/get_forums_use_case.dart';
import '../../../domain/use_cases/get_notices_use_case.dart';
import '../controllers/new_learning_page_controller.dart';

class NewLearningPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AddQuestionUseCase(
        baseCourseRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut(
      () => EditQuestionUseCase(
        baseCourseRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut(
      () => GetForumsUseCase(
        baseCourseRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut(
      () => GetNoticesUseCase(
        baseCourseRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<NewLearningPageController>(
      () => NewLearningPageController(
        courseDetailsUseCase: Get.find(),
        addQuestionUseCase: Get.find(),
        editQuestionUseCase: Get.find(),
        getForumsUseCase: Get.find(),
        getNoticesUseCase: Get.find(),
        getQuizResultUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
