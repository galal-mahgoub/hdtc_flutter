import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/theme/color_manager.dart';
import '../../../../../../core/widgets/button_widget.dart';
import '../../controllers/category_details_controller.dart';

class OptionCategoryCoursesBottomsheet extends StatelessWidget {
  const OptionCategoryCoursesBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryDetailsController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(top: 15.r),
          child: Column(
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
              Expanded(
                child: Container(
                  width: 1.sw,
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13.r),
                      topRight: Radius.circular(13.r),
                    ),
                  ),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Options'.tr,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'UpcomingCourses'.tr,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: ColorManager.black,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          CupertinoSwitch(
                            value: controller.switchLiveClass,
                            onChanged: (value) {
                              controller.switchLiveClass = value;
                              controller.update();
                            },
                            activeColor: context.theme.primaryColor,
                            trackColor: ColorManager.grey1,
                            thumbColor: ColorManager.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'FreeCourses'.tr,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: ColorManager.black,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          CupertinoSwitch(
                            value: controller.switchFreeCourse,
                            onChanged: (value) {
                              controller.switchFreeCourse = value;
                              controller.update();
                            },
                            activeColor: context.theme.primaryColor,
                            trackColor: ColorManager.grey1,
                            thumbColor: ColorManager.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'DownloadableContent'.tr,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: ColorManager.black,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          CupertinoSwitch(
                            value: controller.switchDownloadable,
                            onChanged: (value) {
                              controller.switchDownloadable = value;
                              controller.update();
                            },
                            activeColor: context.theme.primaryColor,
                            trackColor: ColorManager.grey1,
                            thumbColor: ColorManager.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'sortBy'.tr,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.sortBy = null;
                          controller.update();
                        },
                        child: Row(
                          children: [
                            Radio<String?>(
                              value: null,
                              groupValue: controller.sortBy,
                              onChanged: (value) {
                                controller.sortBy = value;
                                controller.update();
                              },
                              fillColor: WidgetStateColor.resolveWith(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return context.theme.primaryColor;
                                  }
                                  return ColorManager.grey4;
                                },
                              ),
                            ),
                            Text(
                              'All'.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.sortBy = 'newest';
                          controller.update();
                        },
                        child: Row(
                          children: [
                            Radio(
                              value: 'newest',
                              groupValue: controller.sortBy,
                              onChanged: (value) {
                                controller.sortBy = value;
                                controller.update();
                              },
                              fillColor: WidgetStateColor.resolveWith(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return context.theme.primaryColor;
                                  }
                                  return ColorManager.grey4;
                                },
                              ),
                            ),
                            Text(
                              'Newest'.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.sortBy = 'expensive';
                          controller.update();
                        },
                        child: Row(
                          children: [
                            Radio(
                              value: 'expensive',
                              groupValue: controller.sortBy,
                              onChanged: (value) {
                                controller.sortBy = value;
                                controller.update();
                              },
                              fillColor: WidgetStateColor.resolveWith(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return context.theme.primaryColor;
                                  }
                                  return ColorManager.grey4;
                                },
                              ),
                            ),
                            Text(
                              'HighestPrice'.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.sortBy = 'inexpensive';
                          controller.update();
                        },
                        child: Row(
                          children: [
                            Radio(
                              value: 'inexpensive',
                              groupValue: controller.sortBy,
                              onChanged: (value) {
                                controller.sortBy = value;
                                controller.update();
                              },
                              fillColor: WidgetStateColor.resolveWith(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return context.theme.primaryColor;
                                  }
                                  return ColorManager.grey4;
                                },
                              ),
                            ),
                            Text(
                              'LowestPrice'.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.sortBy = 'bestsellers';
                          controller.update();
                        },
                        child: Row(
                          children: [
                            Radio(
                              value: 'bestsellers',
                              groupValue: controller.sortBy,
                              onChanged: (value) {
                                controller.sortBy = value;
                                controller.update();
                              },
                              fillColor: WidgetStateColor.resolveWith(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return context.theme.primaryColor;
                                  }
                                  return ColorManager.grey4;
                                },
                              ),
                            ),
                            Text(
                              'bestSeller'.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.sortBy = 'best_rates';
                          controller.update();
                        },
                        child: Row(
                          children: [
                            Radio(
                              value: 'best_rates',
                              groupValue: controller.sortBy,
                              onChanged: (value) {
                                controller.sortBy = value;
                                controller.update();
                              },
                              fillColor: WidgetStateColor.resolveWith(
                                (Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return context.theme.primaryColor;
                                  }
                                  return ColorManager.grey4;
                                },
                              ),
                            ),
                            Text(
                              'bestRated'.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'MoreOptions'.tr,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ShowOnlySubscribe'.tr,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: ColorManager.black,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          CupertinoCheckbox(
                            value: controller.checkSubscribe,
                            onChanged: (value) {
                              controller.checkSubscribe = value!;
                              controller.update();
                            },
                            activeColor: context.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(3.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ShowOnlyFeaturedCourse'.tr,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: ColorManager.black,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          CupertinoCheckbox(
                            value: controller.checkFeaturedCourse,
                            onChanged: (value) {
                              controller.checkFeaturedCourse = value!;
                              controller.update();
                            },
                            activeColor: context.theme.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(3.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ButtonWidget(
                        isLoading: controller.isLoading,
                        colorBtn: context.theme.primaryColor,
                        text: Text(
                          'ApplyOptions'.tr,
                          style: TextStyle(
                            color: ColorManager.white,
                            fontSize: 15.sp,
                          ),
                        ),
                        onPressed: () {
                          controller.getCategoryCourses();
                          Get.back();
                        },
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
