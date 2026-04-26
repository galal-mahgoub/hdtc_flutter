import 'package:hdtc_on/core/languages/app_translations.dart';
import 'package:hdtc_on/core/routes/app_pages.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/course_card_loading.dart';
import 'package:hdtc_on/features/course_feature/domain/entities/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/widgets/course_card.dart';
import '../controllers/newest_courses_controller.dart';

class NewestCoursesView extends StatelessWidget {
  const NewestCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewestCoursesController>(
      init: NewestCoursesController(
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
                    'NewestCourses'.tr,
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
                        'type': 'newest',
                        'title': 'NewestCourses'.tr,
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
