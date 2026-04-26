import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/theme/color_manager.dart';
import '../../../../../../core/widgets/button_widget.dart';
import '../../controllers/meeting_details_controller.dart';

class FinishMeetingDialog extends StatelessWidget {
  const FinishMeetingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeetingDetailsController>(
      builder: (controller) {
        return AlertDialog(
          backgroundColor: ColorManager.white,
          elevation: 0,
          insetPadding: EdgeInsets.symmetric(horizontal: 15.r),
          title: Text(
            'Finish'.tr,
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
                  'AreFinishMeeting'.tr,
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
                        isLoading: controller.isFinishMeetingLoading,
                        colorBtn:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                        text: Text(
                          'Ok'.tr,
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorManager.white),
                        ),
                        onPressed: () => controller.finishMeeting(),
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
