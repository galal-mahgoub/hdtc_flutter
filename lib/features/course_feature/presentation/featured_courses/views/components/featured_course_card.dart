import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/routes/app_pages.dart';
import '../../../../../../core/theme/color_manager.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/custom_image.dart';
import '../../../../../../core/widgets/custom_rating_bar.dart';
import '../../../../domain/entities/course.dart';

class FeatureCourseCard extends StatelessWidget {
  const FeatureCourseCard({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.courseDetails,
        arguments: {
          'id': course.id.toString(),
          'type': course.type,
        },
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 180.h,
            width: 1.sw,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CustomImage(
                path: course.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          PositionedDirectional(
            bottom: 10,
            start: 10,
            end: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.white,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomRatingBar(value: course.rate ?? 0),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 30.r,
                      width: 30.r,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(80.r)),
                        child: CustomImage(
                          path: course.teacher?.avatar ?? '',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Text(
                        course.teacher?.fullName ?? '',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time_filled,
                            size: 17.sp,
                            color: ColorManager.white,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: Text(
                              '${Utils.formatDuration(course.duration ?? '0')} ${'Hour'.tr}',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (course.free ?? false)
            PositionedDirectional(
              top: 10.r,
              end: 10.r,
              child: Container(
                width: 40.w,
                padding: EdgeInsets.symmetric(horizontal: 2.r, vertical: 5.r),
                decoration: BoxDecoration(
                    color: ColorManager.white11,
                    borderRadius: BorderRadius.all(Radius.circular(5.r))),
                child: Text(
                  'Free'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: context.theme.primaryColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
