import 'package:hdtc_on/core/languages/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/theme/color_manager.dart';
import '../../../../../../core/widgets/button_widget.dart';
import '../../controllers/settings_controller.dart';

class LogoutAlertDialog extends StatelessWidget {
  const LogoutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: ColorManager.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 15.r),
          title: Text(
            LocaleKeys.logoutTitle.tr,
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
                  LocaleKeys.logoutContent.tr,
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
                        isLoading: controller.isLoading,
                        colorBtn:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                        text: Text(
                          'Ok'.tr,
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorManager.white),
                        ),
                        onPressed: () => controller.logout(),
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
