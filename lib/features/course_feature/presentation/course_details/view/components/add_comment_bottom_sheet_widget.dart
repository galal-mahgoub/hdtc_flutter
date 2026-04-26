import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/widgets/button_widget.dart';
import '../../controller/courses_details_controller.dart';

class AddCommentBottomSheetCustom extends StatelessWidget {
  const AddCommentBottomSheetCustom(
      {required this.id, required this.type, super.key});

  final String id;
  final String type;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesDetailsController>(
      builder: (controller) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 15.r,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Get.back(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsetsDirectional.only(end: 10.r),
                          padding: EdgeInsets.all(15.r),
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.r)),
                          ),
                          child: Icon(
                            Icons.close,
                            size: 22.sp,
                            color: ColorManager.black,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 1.sw,
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          type == 'add'
                              ? 'Comment'.tr
                              : type == 'reply'
                                  ? 'ReplyComment'.tr
                                  : 'MessageReviewer'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: ColorManager.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Form(
                          key: controller.formComment,
                          child: CustomTextField(
                            keyboardType: TextInputType.text,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.r),
                              borderSide:
                                  const BorderSide(color: ColorManager.grey6),
                            ),
                            controller: controller.messageCommentController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return type == 'add'
                                    ? 'EnterComment'.tr
                                    : type == 'reply'
                                        ? 'EnterReply'.tr
                                        : 'EnterReport'.tr;
                              }
                              return null;
                            },
                            onEditingComplete: () {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ButtonWidget(
                          isLoading: controller.isCommentLoading,
                          colorBtn:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                          text: Text(
                            type == 'add'
                                ? 'SendComment'.tr
                                : type == 'reply'
                                    ? 'SubmitComment'.tr
                                    : 'Report'.tr,
                            style: TextStyle(
                                fontSize: 15.sp, color: ColorManager.white),
                          ),
                          onPressed: () {
                            type == 'add'
                                ? controller.sendComment()
                                : type == 'reply'
                                    ? controller.replyToComment(id)
                                    : controller.replyToComment(id);
                          },
                          width: 1.sw,
                          paddingHorizontal: 10,
                          paddingVertical: 10,
                          marginHorizontal: 5,
                          radius: 10,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
