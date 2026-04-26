import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/widgets/button_widget.dart';
import '../../controllers/quiz_question_create_controller.dart';

class BackAlertDialog extends StatelessWidget {
  const BackAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizQuestionCreateController>(
      builder: (controller) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: ColorManager.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 15.r),
          title: Text(
            'Quiz'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.sp,
              color: ColorManager.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          titlePadding: EdgeInsets.only(top: 15.r, bottom: 15.r),
          contentPadding: EdgeInsets.zero,
          content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'QuizFailed'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13.sp, color: ColorManager.grey5),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        isLoading: controller.isStoreLoading,
                        colorBtn: UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green,
                        text: Text(
                          'Ok'.tr,
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorManager.white),
                        ),
                        onPressed: () async =>
                            await controller.storeResult(isDialog: true),
                        width: 1.sw,
                        paddingHorizontal: 10,
                        paddingVertical: 10,
                        marginHorizontal: 15,
                        radius: 15,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: ButtonWidget(
                        colorBtn: ColorManager.grey10,
                        text: Text(
                          'Cancel'.tr,
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorManager.black),
                        ),
                        onPressed: () {
                          Get.back();
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
                SizedBox(
                  height: 25.h,
                ),
              ]),
        );
      },
    );
  }
}
