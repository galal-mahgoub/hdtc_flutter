import 'package:get/get.dart';

import '../controllers/blogs_controller.dart';

class BlogsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogsController>(
      () => BlogsController(
        blogsUseCase: Get.find(),
        blogsCategoriesUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
