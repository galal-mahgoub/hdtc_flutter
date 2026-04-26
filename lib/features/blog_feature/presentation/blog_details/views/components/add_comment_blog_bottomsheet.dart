import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_text_field.dart';
import 'package:hdtc_on/features/blog_feature/presentation/blog_details/controllers/blog_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/widgets/button_widget.dart';

class AddCommentBlogBottomsheet extends StatelessWidget {
  const AddCommentBlogBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogDetailsController>(
      builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: Container(
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
                  )),
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
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Comments'.tr,
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
                    CustomTextField(
                      keyboardType: TextInputType.text,
                      fillColor: ColorManager.white,
                      controller: controller.commentCtrl,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'EnterComment'.tr;
                        }
                        return null;
                      },
                      // onEditingComplete: () {
                      //   FocusScope.of(context).unfocus();
                      // },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ButtonWidget(
                      isLoading: controller.isSendCommentLoading,
                      colorBtn: UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green,
                      text: Text(
                        'SubmitComment'.tr,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: ColorManager.white,
                        ),
                      ),
                      onPressed: () => controller.addComment(),
                      width: 1.sw,
                      paddingHorizontal: 10,
                      paddingVertical: 10,
                      marginHorizontal: 5,
                      radius: 10,
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
