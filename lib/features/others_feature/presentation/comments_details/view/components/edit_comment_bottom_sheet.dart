import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/widgets/button_widget.dart';
import '../../controllers/comments_details_controller.dart';

class EditCommentBottomSheetCustom extends StatelessWidget {
  const EditCommentBottomSheetCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentsDetailsController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(
            top: 15.r,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () => Get.back(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        margin: EdgeInsetsDirectional.only(end: 10.r),
                        padding: EdgeInsets.all(15.r),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.all(Radius.circular(13.r)),
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
                    topLeft: Radius.circular(13.r),
                    topRight: Radius.circular(13.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'EditComment'.tr,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Form(
                        key: controller.formEditComment,
                        child: CustomTextField(
                          controller: controller.editCommentController,
                          keyboardType: TextInputType.text,
                          hintText: 'Comment'.tr,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide:
                                const BorderSide(color: ColorManager.grey2),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'EnterComment'.tr;
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ButtonWidget(
                        isLoading: controller.isEditeLoading,
                        colorBtn: context.theme.primaryColor,
                        text: Text(
                          'Edit'.tr,
                          style: TextStyle(
                            color: ColorManager.white,
                            fontSize: 15.sp,
                          ),
                        ),
                        onPressed: () => controller.editComment(),
                        width: 1.sw,
                        paddingHorizontal: 10,
                        paddingVertical: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
