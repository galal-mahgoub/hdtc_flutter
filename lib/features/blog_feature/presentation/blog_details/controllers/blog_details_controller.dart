import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/features/blog_feature/domain/use_cases/send_blog_comment_use_case.dart';

import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/blog.dart';

class BlogDetailsController extends GetxController {
  SendBlogCommentUseCase sendBlogCommentUseCase;
  BlogDetailsController({
    required this.sendBlogCommentUseCase,
  });
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController commentCtrl = TextEditingController();

  Blog? blog;

  bool isSendCommentLoading = false;

  Future addComment() async {
    if (!formKey.currentState!.validate() || blog == null) {
      return;
    }
    isSendCommentLoading = true;
    update();

    var result = await sendBlogCommentUseCase(
      blodId: blog!.id.toString(),
      comment: commentCtrl.text,
    );

    result.fold((failure) {
      isSendCommentLoading = false;
      update();

      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      isSendCommentLoading = false;
      update();

      if (Get.isBottomSheetOpen!) {
        commentCtrl.clear();
        Get.back();
      }
      ToastManager.showSuccess(result);
    });
  }

  @override
  void onInit() {
    blog = Get.arguments;
    super.onInit();
  }
}
