import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:hdtc_on/core/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/widgets/custom_video_player.dart';
import '../../controller/courses_details_controller.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';

import 'btn_more_bottom_sheet_widget.dart';

class AppBarCourseDetailsWidget extends StatelessWidget {
  const AppBarCourseDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesDetailsController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: Column(
            children: [
              controller.course!.videoDemo != null &&
                      controller.course!.videoDemo!.isNotEmpty
                  ? CustomVideoPlayer(
                      videoDemo: controller.course!.videoDemo ?? '',
                      videoDemoSource: controller.course!.videoDemoSource ?? '',
                      isPause: controller.isPause,
                    )
                  : SizedBox(
                      height: 240.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: CustomImage(
                          path: controller.course!.image.isNotEmpty
                              ? controller.course!.image
                              : null,
                          fit: BoxFit.cover,
                          width: context.width,
                        ),
                      ),
                    ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 40.r,
                          width: 40.r,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(80.r)),
                            child: CustomImage(
                              path:
                                  controller.course!.teacher?.avatar != null &&
                                          controller.course!.teacher!.avatar
                                              .isNotEmpty
                                      ? controller.course!.teacher!.avatar
                                      : null,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.course!.teacher?.fullName ?? '',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.grey5,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            CustomRatingBar(
                              value: controller.course!.teacher?.rate ?? 0,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    onTap: () {
                      Get.bottomSheet(
                        BtnMoreBottomSheetCustom(
                          title: controller.course!.title,
                        ),
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.r, vertical: 10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        color: ColorManager.white,
                      ),
                      child: Icon(
                        Icons.more_horiz,
                        color: ColorManager.grey9,
                        size: 25.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              if (controller.course!.teacher?.meetingStatus != null &&
                  controller.course!.teacher!.meetingStatus == 'unavailable')
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(11.r),
                    border: Border.all(color: ColorManager.grey6),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration:  BoxDecoration(
                          color: context.theme.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.video_call,
                          size: 20.sp,
                          color: ColorManager.white,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Temporary Unavailable'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: ColorManager.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              controller.course!.teacher?.offlineMessage ?? '',
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 10.sp,
                                color: ColorManager.grey5,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
