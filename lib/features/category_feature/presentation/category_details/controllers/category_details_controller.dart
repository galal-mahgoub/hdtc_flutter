import 'package:get/get.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/category_course.dart';
import '../../../domain/use_cases/get_category_courses_use_case.dart';

class CategoryDetailsController extends GetxController {
  GetCategoryCoursesUseCase getCategoryCoursesUseCase;
  CategoryDetailsController({
    required this.getCategoryCoursesUseCase,
  });

  CategoryCourse? categoryCourse;

  bool isLoading = false;
  String typeFilter = '';
  bool switchLiveClass = false;
  bool switchFreeCourse = false;
  bool switchDownloadable = false;
  bool checkSubscribe = false;
  bool checkFeaturedCourse = false;
  String? sortBy;
  String title = '';
  String categoryId = '';
  List<String> filterValue = [];

  selectFilterItem(String value) {
    if (filterValue.contains(value)) {
      filterValue.remove(value);
    } else {
      filterValue.add(value);
    }

    update();
  }

  Future<void> getCategoryCourses() async {
    isLoading = true;
    update();

    Map<String, Object> query = {};

    if (typeFilter == 'option') {
      List<String> type = [];

      List<String> moreOption = [];
      checkSubscribe ? type.add('subscribe') : type.remove('subscribe');
      checkFeaturedCourse ? type.add('featured') : type.remove('featured');

      query = {
        'type': type,
        'moreOptions': moreOption,
        'upcoming': switchLiveClass ? '1' : '0',
        'free': switchFreeCourse ? '1' : '0',
        'downloadable': switchDownloadable ? '1' : '0',
        if (sortBy != null) 'sort': sortBy!,
      };
    } else if (typeFilter == 'filter') {
      query = {
        'filter_option[]': filterValue,
      };
    }

    var result = await getCategoryCoursesUseCase(
      query: query.isEmpty ? null : query,
      categoryId: categoryId,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      Utils.mapFailureToMessage(failure);
    }, (result) {
      
      categoryCourse = result;
      isLoading = false;
      update();
    });
  }

  @override
  void onInit() async {
    if (Get.arguments != null) {
      title = Get.arguments['title'];
      categoryId = Get.arguments['id'];
    }

    await Future.wait([
      getCategoryCourses(),
    ]);

    super.onInit();
  }
}
