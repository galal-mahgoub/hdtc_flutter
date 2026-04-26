import 'package:hdtc_on/features/others_feature/domain/use_cases/delete_comments_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/edit_comment_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/reply_comment_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/report_comment_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../blog_feature/domain/entities/comment.dart';

class CommentsDetailsController extends GetxController {
  ReplyCommentUseCase replyCommentUseCase;
  EditCommentUseCase editCommentUseCase;
  ReportCommentUseCase reportCommentUseCase;
  DeleteCommentUseCase deleteCommentUseCase;
  CommentsDetailsController({
    required this.replyCommentUseCase,
    required this.deleteCommentUseCase,
    required this.reportCommentUseCase,
    required this.editCommentUseCase,
  });

  GlobalKey<FormState> formComment = GlobalKey<FormState>();
  GlobalKey<FormState> formEditComment = GlobalKey<FormState>();
  TextEditingController messageCommentController = TextEditingController();
  TextEditingController editCommentController = TextEditingController();

  late Comment item;
  String type = '';

  bool isLoading = false;
  bool isDeleteLoading = false;
  bool isEditeLoading = false;

  Future<void> replyComment() async {
    if (!formComment.currentState!.validate()) {
      return;
    }
    isLoading = true;
    update();
    var result = await replyCommentUseCase(
      commentId: item.id.toString(),
      reply: messageCommentController.text,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      isLoading = false;
      update();

      Get.back(closeOverlays: true);
      ToastManager.showSuccess(result);
    });
  }

  Future<void> reportComment() async {
    if (!formComment.currentState!.validate()) {
      return;
    }
    isLoading = true;
    update();
    var result = await reportCommentUseCase(
      commentId: item.id.toString(),
      message: messageCommentController.text,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      isLoading = false;
      update();

      Get.back(closeOverlays: true);
      ToastManager.showSuccess(result);
    });
  }

  Future<void> editComment() async {
    if (!formEditComment.currentState!.validate()) {
      return;
    }
    isEditeLoading = true;
    update();
    var result = await editCommentUseCase(
      commentId: item.id.toString(),
      comment: editCommentController.text,
    );

    result.fold((failure) {
      isEditeLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      item.comment = editCommentController.text;
      isEditeLoading = false;
      update();

      if (Get.isBottomSheetOpen!) {
        Get.back();
      }
      ToastManager.showSuccess(result);
    });
  }

  Future<void> deleteComment() async {
    isDeleteLoading = true;
    update();
    var result = await deleteCommentUseCase(
      commentId: item.id.toString(),
    );

    result.fold((failure) {
      isDeleteLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      isDeleteLoading = false;
      update();
      ToastManager.showSuccess(result);
      Get.back(closeOverlays: true, result: true);
    });
  }

  @override
  Future<void> onInit() async {
    item = Get.arguments['item'];
    type = Get.arguments['type'];

    super.onInit();
  }

  @override
  void onClose() {
    messageCommentController.dispose();
    editCommentController.dispose();
    super.onClose();
  }
}
