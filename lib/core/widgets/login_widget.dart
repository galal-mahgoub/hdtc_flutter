import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import '../services/user_service.dart';
import 'button_widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200.h,
            width: 200.w,
            child: SizedBox(
              height: 100.h,
              width: 160.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: const CustomImage(
                  path: 'assets/images/learning.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'pleaseLogin'.tr,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: ColorManager.black,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'pleaseLoginDetails'.tr,
            style: TextStyle(fontSize: 16.sp, color: ColorManager.black),
          ),
          SizedBox(
            height: 15.h,
          ),
          ButtonWidget(
            width: 1.sw,
            colorBtn: UserService.to.isKsa.value
                ? Colors.green[400]
                : ColorManager.green,
            text: Text(
              'Login'.tr,
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: ColorManager.white,
              ),
            ),
            onPressed: () async => Get.toNamed(Routes.login),
            marginHorizontal: 30,
            paddingVertical: 5,
            paddingHorizontal: 10,
            radius: 60,
          )
        ],
      ),
    );
  }
}
