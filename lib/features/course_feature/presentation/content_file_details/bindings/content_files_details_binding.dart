import 'package:hdtc_on/features/course_feature/domain/use_cases/read_lesson_use_case.dart';
import 'package:get/get.dart';

import '../controllers/content_files_details_controller.dart';

class ContentFilesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ReadLessonUseCase(
        baseCourseRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.put<ContentFilesController>(
      ContentFilesController(
        readLessonUseCase: Get.find(),
      ),
    );
  }
}
