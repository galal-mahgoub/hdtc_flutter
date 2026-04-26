import 'package:get/get.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/course.dart';
import '../../../domain/use_cases/courses_use_case.dart';

class FreeCoursesController extends GetxController {
  CoursesUseCase coursesUseCase;
  FreeCoursesController({
    required this.coursesUseCase,
  });

  static FreeCoursesController get to => Get.find();

  bool isLoading = false;
  List<Course> courses = [];

  Future<void> getFreeCourses() async {
    isLoading = true;
    update();

    var result = await coursesUseCase(
      offset: '1',
      limit: '5',
      isFree: true,
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
    await getFreeCourses();
    super.onInit();
  }
}
