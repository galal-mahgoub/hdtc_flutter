import 'package:get/get.dart';

import '../../../domain/use_cases/send_blog_comment_use_case.dart';
import '../controllers/blog_details_controller.dart';

class BlogDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SendBlogCommentUseCase(
        baseBlogRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<BlogDetailsController>(
      () => BlogDetailsController(
        sendBlogCommentUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
