import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/widgets/button_widget.dart';
import '../../../../../category_feature/domain/entities/category.dart';
import '../../controllers/providers_controller.dart';

class FilterInstructorsBottomSheet extends StatelessWidget {
  const FilterInstructorsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProvidersController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(top: 15.r),
          child: SingleChildScrollView(
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
                  padding: EdgeInsets.symmetric(
                    vertical: 24.r,
                    horizontal: 24.r,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13.r),
                      topRight: Radius.circular(13.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'sortBy'.tr,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      ),
                      RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        value: '',
                        groupValue: controller.instructorsSortBy,
                        onChanged: (value) =>
                            controller.changeInstructorSortBy(value ?? ''),
                        activeColor: context.theme.primaryColor,
                        title: Text(
                          'All'.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorManager.black,
                          ),
                        ),
                      ),
                      RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        value: 'top_sale',
                        groupValue: controller.instructorsSortBy,
                        onChanged: (value) =>
                            controller.changeInstructorSortBy(value ?? ''),
                        activeColor: context.theme.primaryColor,
                        title: Text(
                          'bestSeller'.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorManager.black,
                          ),
                        ),
                      ),
                      RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        value: 'top_rate',
                        groupValue: controller.instructorsSortBy,
                        onChanged: (value) =>
                            controller.changeInstructorSortBy(value ?? ''),
                        activeColor: context.theme.primaryColor,
                        title: Text(
                          'bestRated'.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorManager.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Categories'.tr,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      ),
                      controller.isCategoriesLoading
                          ?  Center(
                              child: CircularProgressIndicator(
                                color: context.theme.primaryColor,
                              ),
                            )
                          : Wrap(
                              children: List.generate(
                                  controller.categories.length, (index) {
                                Category category =
                                    controller.categories[index];
                                return InkWell(
                                  onTap: () => controller
                                      .selectCategory(category.id.toString()),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 7.r, horizontal: 5.r),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.r, vertical: 5.r),
                                    decoration: BoxDecoration(
                                      color: controller.selectedCategories
                                              .contains(category.id.toString())
                                          ? context.theme.primaryColor
                                          : ColorManager.white11,
                                      border: Border.all(
                                          color: controller.selectedCategories
                                                  .contains(
                                                      category.id.toString())
                                              ? context.theme.primaryColor
                                              : ColorManager.grey4,
                                          width: 1),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.r),
                                      ),
                                    ),
                                    child: Text(
                                      category.title,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: controller.selectedCategories
                                                .contains(
                                                    category.id.toString())
                                            ? ColorManager.white
                                            : ColorManager.black,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ButtonWidget(
                        colorBtn: context.theme.primaryColor,
                        text: Text(
                          'FilterItem'.tr,
                          style: TextStyle(
                            color: ColorManager.white,
                            fontSize: 15.sp,
                          ),
                        ),
                        onPressed: () async {
                          if (Get.isBottomSheetOpen!) {
                            Get.back();
                          }
                          controller.getInstructors();
                        },
                        width: 1.sw,
                        paddingHorizontal: 10,
                        paddingVertical: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
