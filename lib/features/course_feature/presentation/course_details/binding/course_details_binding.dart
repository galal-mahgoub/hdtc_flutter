import 'package:get/get.dart';

import '../../../domain/use_cases/get_quiz_result_use_case.dart';
import '../controller/courses_details_controller.dart';

class CourseDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetQuizResultUseCase(
        baseCourseRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<CoursesDetailsController>(
      () => CoursesDetailsController(
        getQuizResultUseCase: Get.find(),
        courseDetailsUseCase: Get.find(),
        addFavoriteUseCase: Get.find(),
        getReasonsUseCase: Get.find(),
        addReportUseCase: Get.find(),
        getCourseContentUseCase: Get.find(),
        sendCourseCommentUseCase: Get.find(),
        replyToCommentUseCase: Get.find(),
        addCourseReviewUseCase: Get.find(),
        addCourseFreeUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
