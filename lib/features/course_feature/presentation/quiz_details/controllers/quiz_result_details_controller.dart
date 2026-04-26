import 'package:get/get.dart';

import '../../../domain/entities/result.dart';

class QuizResultDetailsController extends GetxController {
  Result? result;

  @override
  void onInit() {
    result = Get.arguments['quizResultDetails'];
    super.onInit();
  }
}
