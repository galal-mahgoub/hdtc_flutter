import 'package:get/get.dart';

import '../controllers/search_courses_controller.dart';

class SearchCoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchCoursesController>(
      () => SearchCoursesController(
        coursesUseCase: Get.find(),
        searchCoursesUseCase: Get.find(),
      ),
    );
  }
}
