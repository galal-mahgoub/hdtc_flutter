import 'package:hdtc_on/core/consts/assets.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/instructor_details_controller.dart';

class MeetingWidget extends StatelessWidget {
  const MeetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InstructorDetailsController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (controller.provider!.meetingStatus == 'unavailable')
                  SizedBox(
                    height: 150.h,
                    width: 150.w,
                    child: const CustomImage(
                      path: Assets.noData,
                    ),
                  ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  controller.provider!.meetingStatus == 'unavailable'
                      ? 'MeetingUnavailable'.tr
                      : '${'ReserveMeeting'.tr}\n${'HourlyCharge'.tr} ${controller.provider!.meeting?.inPersonPriceWithDiscountString ?? ''}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: ColorManager.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
