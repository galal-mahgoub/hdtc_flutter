import 'package:hdtc_on/features/course_feature/domain/use_cases/courses_use_case.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/course.dart';

class NewestCoursesController extends GetxController {
  CoursesUseCase coursesUseCase;
  NewestCoursesController({required this.coursesUseCase});

  static NewestCoursesController get to => Get.find();

  bool isLoading = false;
  List<Course> courses = [];

  Future<void> getNewestCourses() async {
    isLoading = true;
    update();

    var result = await coursesUseCase(
      sort: 'newest',
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
    await getNewestCourses();
    super.onInit();
  }
}
