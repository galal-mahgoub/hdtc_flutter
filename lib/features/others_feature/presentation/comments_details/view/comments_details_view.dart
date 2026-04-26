import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/services/user_service.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../controllers/comments_details_controller.dart';
import 'components/delete_comment_dialog.dart';
import 'components/edit_comment_bottom_sheet.dart';
import 'components/reply_report_comment_bottom_sheet_widget.dart';

class CommentsDetailsView extends GetView<CommentsDetailsController> {
  const CommentsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentsDetailsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.white13,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'CommentsDetails'.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16).r,
            children: [
              controller.type == 'comment'
                  ? Container(
                      width: 1.sw,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.r,
                        vertical: 10.r,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(color: ColorManager.grey2),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.r),
                            decoration:  BoxDecoration(
                              color: context.theme.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.video_call,
                              size: 25.sp,
                              color: ColorManager.white,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ThisCommentFor'.tr,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: ColorManager.grey8,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  controller.item.course?.title != null &&
                                          controller
                                              .item.course!.title.isNotEmpty
                                      ? controller.item.course!.title
                                      : controller.item.blog?.title != null &&
                                              controller
                                                  .item.blog!.title.isNotEmpty
                                          ? controller.item.blog!.title
                                          : '',
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 13.sp,
                                      color: ColorManager.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 52.h,
                          width: 55.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: CustomImage(
                              path: controller.item.user.avatar.isNotEmpty
                                  ? controller.item.user.avatar
                                  : null,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.item.user.fullName,
                                maxLines: 2,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.black,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Column(
                                children: [
                                  Text(
                                    '${controller.item.user.roleName} (${'Role'.tr})',
                                    maxLines: 2,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 9.sp,
                                      color: ColorManager.grey5,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                controller.item.comment,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorManager.grey8,
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.r),
                  topLeft: Radius.circular(15.r)),
              color: ColorManager.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    colorBtn:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                    text: Text(
                      controller.type == 'comment' ? 'Edit'.tr : 'Reply'.tr,
                      style:
                          TextStyle(fontSize: 15.sp, color: ColorManager.white),
                    ),
                    onPressed: () {
                      controller.editCommentController.clear();
                      controller.messageCommentController.clear();

                      Get.bottomSheet(
                        controller.type == 'comment'
                            ? const EditCommentBottomSheetCustom()
                            : const ReplyReportCommentBottomSheetCustom(
                                type: 'reply',
                              ),
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                      );
                    },
                    width: 1.sw,
                    paddingHorizontal: 10,
                    paddingVertical: 10,
                    marginHorizontal: 15,
                    radius: 15,
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: ButtonWidget(
                    colorBtn: controller.type == 'comment'
                        ? ColorManager.red
                        : ColorManager.white,
                    colorBorder: controller.type == 'comment'
                        ? null
                        : context.theme.primaryColor,
                    text: Text(
                      controller.type == 'comment' ? 'Delete'.tr : 'Report'.tr,
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: controller.type == 'comment'
                              ? ColorManager.white
                              : context.theme.primaryColor),
                    ),
                    onPressed: () {
                      if (controller.type == 'comment') {
                        Get.dialog(
                          const DeleteCommentDialog(),
                          barrierDismissible: false,
                        );
                      } else {
                        controller.editCommentController.clear();
                        controller.messageCommentController.clear();

                        Get.bottomSheet(
                          const ReplyReportCommentBottomSheetCustom(
                            type: 'report',
                          ),
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                        );
                      }
                    },
                    width: 1.sw,
                    paddingHorizontal: 10,
                    paddingVertical: 10,
                    marginHorizontal: 15,
                    radius: 15,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
