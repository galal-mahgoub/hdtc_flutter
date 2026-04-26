import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/widgets/button_widget.dart';
import '../../../../domain/entities/category_course.dart';
import '../../controllers/category_details_controller.dart';

class FilterCategoryCoursesBottomsheet extends StatelessWidget {
  const FilterCategoryCoursesBottomsheet({super.key});

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
                onTap: () => Get.back(),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
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
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
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
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    controller.categoryCourse?.filters.length ??
                                        0,
                                itemBuilder: (context, index) {
                                  if (controller.categoryCourse == null) {
                                    return const SizedBox();
                                  }
                                  return FilterItemCard(
                                    filter: controller
                                        .categoryCourse!.filters[index],
                                  );
                                },
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              ButtonWidget(
                                isLoading: controller.isLoading,
                                colorBtn: context.theme.primaryColor,
                                text: Text(
                                  'FilterItem'.tr,
                                  style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                onPressed: () {
                                  Get.back();
                                  controller.getCategoryCourses();
                                },
                                width: 1.sw,
                                paddingHorizontal: 10,
                                paddingVertical: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class FilterItemCard extends StatelessWidget {
  const FilterItemCard({
    super.key,
    required this.filter,
  });

  final Filter filter;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryDetailsController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              filter.title,
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: ColorManager.black,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filter.options.length,
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    filter.options[index].title,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: ColorManager.black,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  CupertinoCheckbox(
                    value: controller.filterValue
                        .contains(filter.options[index].id.toString()),
                    onChanged: (value) => controller
                        .selectFilterItem(filter.options[index].id.toString()),
                    activeColor: context.theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3.r),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        );
      },
    );
  }
}
