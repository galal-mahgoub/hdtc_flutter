import 'dart:async';

import 'package:hdtc_on/core/utils/toast_manager.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/close_ticket_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/reply_ticket_use_case.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/ticket.dart';

class SupportDetailsController extends GetxController {
  CloseTicketUseCase closeTicketUseCase;
  ReplyTicketUseCase replyTicketUseCase;
  SupportDetailsController({
    required this.closeTicketUseCase,
    required this.replyTicketUseCase,
  });

  GlobalKey<FormState> formReply = GlobalKey<FormState>();
  TextEditingController replyController = TextEditingController();

  ScrollController scrollConversationController = ScrollController();
  PlatformFile file = PlatformFile(name: '', size: 0);
  String size = '';
  StreamController<Widget> overlayController =
      StreamController<Widget>.broadcast();

  Ticket? item;

  bool isCloseingTicketLoading = false;
  bool isReplyTicketLoading = false;

  Future<void> closeTicket() async {
    isCloseingTicketLoading = true;
    update();
    var result = await closeTicketUseCase(ticketId: item!.id.toString());

    result.fold((failure) {
      isCloseingTicketLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      isCloseingTicketLoading = false;
      update();
      Get.back(closeOverlays: true, result: true);

      ToastManager.showSuccess(result);
    });
  }

  Future<void> replyTicket() async {
    if (!formReply.currentState!.validate()) {
      return;
    }
    isReplyTicketLoading = true;
    update();
    var result = await replyTicketUseCase(
      ticketId: item!.id.toString(),
      message: replyController.text,
      file: file,
    );

    result.fold((failure) {
      isReplyTicketLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      isReplyTicketLoading = false;
      update();
      item!.conversations = [
        ...item!.conversations,
        Conversation(
          message: replyController.text.trim().toString(),
          attach: file.path,
          sender: item!.user,
          createdAt: (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString(),
          supporter: null,
        )
      ];

      Get.back();

      ToastManager.showSuccess(result);
    });
  }

  @override
  Future<void> onInit() async {
    item = Get.arguments['item'];

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    scrollConversationController
        .jumpTo(scrollConversationController.position.maxScrollExtent);
  }

  @override
  void onClose() {
    overlayController.close();
    replyController.dispose();
    scrollConversationController.dispose();
    super.onClose();
  }

  void attachFiles() async {
    try {
      file = await Utils.attachFiles();

      if (file.name.isNotEmpty) {
        Get.log('file.extension******${file.extension}');
        Get.log('file.path******${file.path.toString().split('/').last}');
        Get.log('fileName******${file.name}');
        Get.log(
            'mediaType******${Utils.getFileType(file.extension.toString().toLowerCase())}');
        const kb = 1024;
        const mb = kb * 1024;
        const gb = mb * 1024;

        if (file.size >= gb) {
          size = '${(file.size / gb).toStringAsFixed(2)} GB';
        } else if (file.size >= mb) {
          size = '${(file.size / mb).toStringAsFixed(2)} MB';
        } else if (file.size >= kb) {
          size = '${(file.size / kb).toStringAsFixed(2)} KB';
        } else {
          size = '$file.value.size bytes';
        }
      }
      update();
    } catch (e) {
      ToastManager.showError(e.toString());
    }
  }
}
