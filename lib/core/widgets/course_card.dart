import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../features/course_feature/domain/entities/course.dart';
import '../routes/app_pages.dart';
import '../theme/color_manager.dart';
import '../utils/utils.dart';
import 'custom_image.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onTap: () => Get.toNamed(
        Routes.courseDetails,
        arguments: {
          'id': course.id.toString(),
          'type': course.type,
        },
      ),
      child: SizedBox(
        width: 176.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 1.sw,
              child: Stack(
                children: [
                  SizedBox(
                    height: 104.h,
                    width: 1.sw,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: CustomImage(
                        path: course.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 20.h,
                    // width: 50.w,
                    // alignment: AlignmentDirectional.topStart,
                    padding: EdgeInsets.symmetric(horizontal: 5.r),
                    margin: EdgeInsetsDirectional.only(start: 5.r, top: 5.r),
                    decoration: BoxDecoration(
                      color: ColorManager.white11,
                      borderRadius: BorderRadius.all(
                        Radius.circular(6.r),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: ColorManager.yellow,
                          size: 12.r,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          course.rate.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 8.sp,
                            color: ColorManager.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (course.authHasBought)
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        height: 6.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          border: Border.all(
                            color: ColorManager.white,
                            width: 1.5.r,
                          ),
                        ),
                        margin: EdgeInsetsDirectional.only(
                            bottom: 10.r, start: 10.r, end: 10.r),
                        child: LinearProgressIndicator(
                          minHeight: 5.h,
                          color: ColorManager.yellow,
                          backgroundColor: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          value: (course.progressPercent ?? 0) / 100,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.black,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: ColorManager.grey4,
                              size: 15.sp,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: Text(
                                course.teacher?.fullName ?? '',
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 8.sp,
                                  color: ColorManager.grey1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: ColorManager.grey4,
                              size: 15.sp,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: Text(
                                '${Utils.formatDuration(course.duration ?? '0')} ${'Hour'.tr}',
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 8.sp,
                                  color: ColorManager.grey1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (course.free ?? false) ...[
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      (course.free ?? false) ? 'Free'.tr : course.price ?? '0',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: context.theme.primaryColor,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
