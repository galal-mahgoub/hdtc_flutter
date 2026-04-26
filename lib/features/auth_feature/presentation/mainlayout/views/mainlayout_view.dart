import 'package:hdtc_on/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/color_manager.dart';
import '../controllers/mainlayout_controller.dart';
import 'components/custom_tab_item.dart';

class MainLayoutView extends StatelessWidget {
  const MainLayoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainLayoutController>(
      builder: (controller) {
        return Material(
          child: CustomLoading(
            widget: Scaffold(
              backgroundColor: ColorManager.whiteColor,
              body: Column(
                children: [
                  Expanded(
                    child: controller.pages[controller.currentIndex],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: kBottomNavigationBarHeight.h +
                            context.mediaQueryPadding.bottom,
                        padding: EdgeInsets.only(
                            bottom: context.mediaQueryPadding.bottom),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff000000).withOpacity(.9),
                              blurRadius: 8.r,
                              offset: Offset(0, 8.r),
                              spreadRadius: 0,
                            ),
                          ],
                          border: Border.all(
                            width: 1.w,
                            color: ColorManager.textfieldBorderColor,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTabItem(
                              onTap: () => controller.changeIndex(0),
                              label: 'Categories'.tr,
                              icon: Icons.grid_view_rounded,
                              isSelected: controller.currentIndex == 0,
                            ),
                            CustomTabItem(
                              onTap: () => controller.changeIndex(1),
                              label: 'Instructors'.tr,
                              icon: Icons.groups_rounded,
                              isSelected: controller.currentIndex == 1,
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            CustomTabItem(
                              onTap: () => controller.changeIndex(3),
                              label: 'MyCourses'.tr,
                              icon: Icons.video_call,
                              isSelected: controller.currentIndex == 3,
                            ),
                            CustomTabItem(
                              onTap: () => controller.changeIndex(4),
                              label: 'Settings'.tr,
                              icon: Icons.settings,
                              isSelected: controller.currentIndex == 4,
                            ),
                          ],
                        ),
                      ),
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 200),
                        top: controller.currentIndex == 2
                            ? -((kBottomNavigationBarHeight - 16).h / 2)
                            : 0,
                        bottom: controller.currentIndex == 2
                            ? null
                            : 0 + context.mediaQueryPadding.bottom,
                        right: 0,
                        left: 0,
                        // alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              customBorder: const CircleBorder(),
                              onTap: () => controller.changeIndex(2),
                              child: Container(
                                height: 40.h,
                                width: 40.h,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                  color: controller.currentIndex == 2
                                      ? context.theme.primaryColor
                                      : ColorManager.yellow,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.home,
                                    color: ColorManager.white,
                                    size: 25.sp,
                                  ),
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: controller.currentIndex == 2 ? 8.h : 0,
                            ),
                            if (controller.currentIndex == 2) ...[
                              Text(
                                'Home'.tr,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: controller.currentIndex == 2
                                      ? context.theme.primaryColor
                                      : Colors.transparent,
                                ),
                              ),
                            ],
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            isLoading: controller.isLoading,
          ),
        );
      },
    );
  }
}
