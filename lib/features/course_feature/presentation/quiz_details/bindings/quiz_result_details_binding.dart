import 'package:get/get.dart';

import '../controllers/quiz_result_details_controller.dart';

class QuizResultDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizResultDetailsController>(
      () => QuizResultDetailsController(),
    );
  }
}
