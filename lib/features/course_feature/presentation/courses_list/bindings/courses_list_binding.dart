import 'package:get/get.dart';

import '../controllers/courses_list_controller.dart';

class CoursesListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoursesListController>(
      () => CoursesListController(
        coursesUseCase: Get.find(),
      ),
    );
  }
}
