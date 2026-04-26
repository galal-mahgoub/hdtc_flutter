import 'package:get/get.dart';

import '../../../domain/use_cases/my_courses_use_case.dart';
import '../controllers/my_courses_controller.dart';

class MyCoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MyCoursesUseCase(
        baseCourseRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<MyCoursesController>(
      () => MyCoursesController(
        myCoursesUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
