import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/utils/utils.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:hdtc_on/features/course_feature/domain/entities/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';
import 'custom_rating_bar.dart';

class PageListCourseCard extends StatelessWidget {
  const PageListCourseCard({
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
      child: Container(
        padding: const EdgeInsets.all(8).r,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              SizedBox(
                width: 100.w,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 65.h,
                      width: 100.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: CustomImage(
                          path: course.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (course.authHasBought)
                      Align(
                        alignment: AlignmentDirectional.bottomStart,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.r),
                                bottomLeft: Radius.circular(10.r)),
                            gradient: LinearGradient(
                              begin: AlignmentDirectional.bottomCenter,
                              end: AlignmentDirectional.topCenter,
                              colors: [
                                ColorManager.black.withOpacity(.8),
                                ColorManager.black.withOpacity(.2),
                              ],
                            ),
                          ),
                          child: Container(
                            height: 6.h,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                                border: Border.all(
                                    color: ColorManager.white, width: 1.5.w)),
                            margin: EdgeInsetsDirectional.only(
                                bottom: 10.r, start: 10.r, end: 10.r),
                            child: LinearProgressIndicator(
                              minHeight: 5.h,
                              color: ColorManager.yellow,
                              backgroundColor: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                              value: (course.progressPercent ?? 0) / 100,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        CustomRatingBar(value: course.rate ?? 0),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
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
                                  '${Utils.formatDuration(course.duration ?? '0')} ${'Hours'.tr}',
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
                          width: 15.w,
                        ),
                        if (course.free ?? false)
                          Text(
                            'Free'.tr,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12.sp,
                              color:context.theme.primaryColor,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
