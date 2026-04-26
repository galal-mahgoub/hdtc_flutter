import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/widgets/custom_text_field.dart';

import '../../../../../../core/routes/app_pages.dart';
import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/theme/color_manager.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shape: const Border(bottom: BorderSide.none),
      toolbarHeight: 70.h,
      elevation: 0,
      titleSpacing: 0,
      title: Row(
        children: [
          SizedBox(
            width: 16.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () {
                  return Text(
                    UserService.to.currentUser.value != null
                        ? '${'hi'.tr} ${UserService.to.currentUser.value!.fullName}'
                        : 'HDTC ON',
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: ColorManager.white,
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
              Text(
                'LetStartLearning'.tr,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: ColorManager.white,
                ),
              ),
            ],
          ),
        ],
      ),
      pinned: true,
      stretch: true,
      actions: [
        8.horizontalSpace,
        if (UserService.to.currentUser.value == null)
          InkWell(
            onTap: () => Get.toNamed(Routes.login),
            borderRadius: BorderRadius.all(
              Radius.circular(13.r),
            ),
            child: Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: ColorManager.blackOpacity,
                    borderRadius: BorderRadius.all(
                      Radius.circular(13.r),
                    ),
                  ),
                  child: Icon(
                    Icons.login,
                    size: 20.sp,
                    color: ColorManager.white,
                  ),
                ),
              ],
            ),
          ),
        SizedBox(
          width: 8.w,
        ),
        InkWell(
          onTap: () => Get.toNamed(Routes.notifications),
          borderRadius: BorderRadius.all(
            Radius.circular(13.r),
          ),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: ColorManager.blackOpacity,
                  borderRadius: BorderRadius.all(Radius.circular(13.r)),
                ),
                child: Icon(
                  Icons.notifications_rounded,
                  size: 20.sp,
                  color: ColorManager.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
      ],
      backgroundColor: Colors.transparent,
      bottom: PreferredSize(
        preferredSize: Size(1.r, 70.h),
        child: Container(
          height: 80.h,
          decoration: BoxDecoration(
            color: context.theme.primaryColor,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r)),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              height: 40.h,
              child: InkWell(
                onTap: () => Get.toNamed(Routes.searchCourses),
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                child: CustomTextField(
                  enabled: false,
                  contentPadding: EdgeInsets.zero,
                  hintText: "WhatAreGoingFind".tr,
                  prefixWidget: const Icon(
                    Icons.search,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            color: context.theme.primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15.r),
              bottomLeft: Radius.circular(15.r),
            ),
          ),
        ),
      ),
    );
  }
}
