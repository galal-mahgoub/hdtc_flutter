import 'package:get/get.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/course.dart';
import '../../../domain/use_cases/courses_use_case.dart';

class BestRatedCoursesController extends GetxController {
  CoursesUseCase coursesUseCase;
  BestRatedCoursesController({
    required this.coursesUseCase,
  });

  static BestRatedCoursesController get to => Get.find();

  bool isLoading = false;
  List<Course> courses = [];

  Future<void> getBestRatedCourses() async {
    isLoading = true;
    update();

    var result = await coursesUseCase(
      sort: 'best_rates',
      offset: '1',
      limit: '5',
    );

    result.fold((failure) {
      isLoading = false;
      update();
      Utils.mapFailureToMessage(failure);
    }, (result) {
      courses = result;
      isLoading = false;
      update();
    });
  }

  @override
  void onInit() async {
    await getBestRatedCourses();
    super.onInit();
  }
}
