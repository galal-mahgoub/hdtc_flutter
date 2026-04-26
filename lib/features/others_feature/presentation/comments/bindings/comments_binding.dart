import 'package:get/get.dart';

import '../../../domain/use_cases/get_comments_use_case.dart';

import '../controllers/comments_controller.dart';

class CommentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetCommentsUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    
    Get.lazyPut<CommentsController>(
      () => CommentsController(
        getCommentsUseCase: Get.find(),
       
      ),
      fenix: true,
    );
  }
}
