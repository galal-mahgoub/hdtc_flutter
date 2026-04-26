import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/languages/app_translations.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/widgets/course_card_loading.dart';
import '../../../domain/entities/course.dart';
import '../controllers/best_rated_courses_controller.dart';

class BestRatedCoursesView extends StatelessWidget {
  const BestRatedCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BestRatedCoursesController>(
      init: BestRatedCoursesController(
        coursesUseCase: Get.find(),
      ),
      builder: (controller) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16.r,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'BestRated'.tr,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.black,
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(
                      Routes.coursesList,
                      arguments: {
                        'type': 'best_rates',
                        'title': 'BestRated'.tr,
                      },
                    ),
                    child: Text(
                      'viewAll'.tr,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: ColorManager.grey1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            8.verticalSpace,
            controller.isLoading
                ? const CourseCardLoading(
                    count: 6,
                  )
                : controller.courses.isEmpty
                    ? SizedBox(
                        width: 1.sw,
                        height: 168.h,
                        child: Center(
                          child: Text(
                            LocaleKeys.noCoursesAvailable.tr,
                          ),
                        ),
                      )
                    : Container(
                        width: 1.sw,
                        height: 168.h,
                        margin: EdgeInsets.only(bottom: 15.r),
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 16.r),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: controller.courses.length,
                          itemBuilder: (context, index) {
                            Course course = controller.courses[index];
                            return CourseCard(
                              course: course,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              16.horizontalSpace,
                        ),
                      ),
          ],
        );
      },
    );
  }
}
