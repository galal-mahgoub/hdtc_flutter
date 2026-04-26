import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/utils/utils.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:hdtc_on/core/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/prerequisite.dart';

class PrerequisitesWidget extends StatelessWidget {
  const PrerequisitesWidget({
    super.key,
    required this.prerequisite,
  });

  final Prerequisite prerequisite;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 180.h,
          width: 1.sw,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CustomImage(
              path: prerequisite.course.image.isNotEmpty
                  ? prerequisite.course.image
                  : null,
              fit: BoxFit.fill,
            ),
          ),
        ),
        PositionedDirectional(
          bottom: 0,
          start: 0,
          end: 0,
          child: Container(
            padding: EdgeInsets.only(left: 10.r, right: 10.r, bottom: 10.r),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  prerequisite.course.title,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.white,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomRatingBar(
                  value: prerequisite.course.rate ?? 0,
                ),
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
                          path: prerequisite.course.teacher?.avatar != null &&
                                  prerequisite.course.teacher!.avatar.isNotEmpty
                              ? prerequisite.course.teacher!.avatar
                              : null,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Expanded(
                      child: Text(
                        prerequisite.course.teacher?.fullName ?? '',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
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
                              '${Utils.formatDuration(prerequisite.course.duration.toString())} ${'Hour'.tr}',
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
                    SizedBox(
                      width: 5.w,
                    ),
                    if (prerequisite.requiredd == '1')
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.r, vertical: 2.r),
                        decoration: BoxDecoration(
                            color: ColorManager.black.withOpacity(.5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r))),
                        child: Text(
                          'Required',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorManager.red,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (prerequisite.course.free ?? false)
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
    );
  }
}
