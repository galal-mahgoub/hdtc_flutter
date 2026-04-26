import 'package:hdtc_on/features/course_feature/domain/entities/course.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/use_cases/courses_use_case.dart';

class CoursesListController extends GetxController {
  CoursesUseCase coursesUseCase;
  CoursesListController({
    required this.coursesUseCase,
  });

  late PagingController<int, Course> pagingController;
  String offset = '1';
  String sort = '';

  bool isLoading = false;

  Future<void> getCourses() async {
    var result = await coursesUseCase(
      sort: sort == 'FreeCourses' ? null : sort,
      offset: offset,
      limit: '10',
      isFree: sort == 'FreeCourses',
    );

    result.fold((failure) {
      pagingController.error = failure.message;

      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      if (isClosed) {
        return;
      }
      if (result.length >= 10) {
        offset = (int.parse(offset) + 1).toString();
        pagingController.appendPage(result, int.parse(offset));
      } else {
        pagingController.appendLastPage(result);
      }
    });
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      sort = Get.arguments['type'] ?? '';
    }
    pagingController = PagingController(firstPageKey: int.parse(offset));
    pagingController.addPageRequestListener((pageKey) async {
      await getCourses();
    });
    super.onInit();
  }
}
