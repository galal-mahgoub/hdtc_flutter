import 'package:hdtc_on/core/services/user_service.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/my_courses_use_case.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/course.dart';

class MyCoursesController extends GetxController {
  MyCoursesUseCase myCoursesUseCase;
  MyCoursesController({
    required this.myCoursesUseCase,
  });
  bool isLoading = false;

  List<Course> courses = [];

  Future<void> getMyCourses() async {
    isLoading = true;
    update();

    var result = await myCoursesUseCase();

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
    if (UserService.to.currentUser.value != null) {
      await getMyCourses();
    }
    super.onInit();
  }
}
