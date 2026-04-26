import 'package:flutter_html/flutter_html.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/instructor_details_controller.dart';

class AboutInstructor extends StatelessWidget {
  const AboutInstructor({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InstructorDetailsController>(
      builder: (controller) {
        return Column(
          children: [
            if (controller.provider!.meetingStatus == 'unavailable')
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(11.r),
                      border: Border.all(
                        color: ColorManager.grey6,
                      ),
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
                                'InstructorUnavailable'.tr,
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
                                controller.provider?.offlineMessage ?? '',
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
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            Html(
              data: controller.provider!.about ?? '',
              style: {
                // Add any custom styles here
                "body": Style(
                  fontSize: FontSize(12.sp),
                ),
              },
            )
          ],
        );
      },
    );
  }
}
