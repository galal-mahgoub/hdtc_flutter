import 'package:hdtc_on/features/course_feature/domain/entities/course.dart';
import 'package:hdtc_on/features/course_feature/domain/use_cases/featured_courses_use_case.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/utils.dart';

class FeaturedCoursesController extends GetxController {
  FeaturedCoursesUseCase featuredCoursesUseCase;
  FeaturedCoursesController({required this.featuredCoursesUseCase});

  static FeaturedCoursesController get to => Get.find();

  int currentSliderIndex = 0;
  bool isLoading = false;

  List<Course> featuredCourses = [];

  changeSlider(int value) {
    currentSliderIndex = value;
    update();
  }

  Future<void> getFeaturedCourses() async {
    isLoading = true;
    update();

    var result = await featuredCoursesUseCase(
      categoryId: Get.arguments?['id'],
    );

    result.fold((failure) {
      isLoading = false;
      update();
      Utils.mapFailureToMessage(failure);
    }, (result) {
      featuredCourses = result;
      isLoading = false;
      update();
    });
  }

  @override
  void onInit() async {
    await getFeaturedCourses();
    super.onInit();
  }
}
