import 'package:get/get.dart';

import '../../../domain/use_cases/delete_comments_use_case.dart';
import '../../../domain/use_cases/edit_comment_use_case.dart';
import '../../../domain/use_cases/reply_comment_use_case.dart';
import '../../../domain/use_cases/report_comment_use_case.dart';
import '../controllers/comments_details_controller.dart';

class CommentsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ReplyCommentUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => EditCommentUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => ReportCommentUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => DeleteCommentUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut<CommentsDetailsController>(
      () => CommentsDetailsController(
        replyCommentUseCase: Get.find(),
        editCommentUseCase: Get.find(),
        reportCommentUseCase: Get.find(),
        deleteCommentUseCase: Get.find(),
      ),
    );
  }
}
