import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:hdtc_on/core/services/user_service.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/meeting_details_controller.dart';
import 'finish_meeting_dialog.dart';

class BtnMoreMeetingDetailsBottomSheetCustom extends StatelessWidget {
  const BtnMoreMeetingDetailsBottomSheetCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeetingDetailsController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(
            top: 15.r,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => Get.back(),
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
              InkWell(
                onTap: () => Get.back(),
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              Container(
                width: 1.sw,
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'MeetingOptions'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: ColorManager.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        UserService.to.currentUser.value != null
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Add2Calendar.addEvent2Cal(
                                        Utils.buildEvent(
                                            title:
                                                '${'Meeting with'.tr} ${controller.item!.user.fullName}',
                                            date: int.parse(
                                                controller.item!.date),
                                            duration: DateFormat('hh:mma')
                                                .parse(
                                                    controller.item!.time.end ??
                                                        '0')
                                                .difference(DateFormat('hh:mma')
                                                    .parse(controller
                                                            .item!.time.start ??
                                                        '0'))
                                                .inHours),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          size: 18.sp,
                                          color: ColorManager.black6,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          'AddCalender'.tr,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: ColorManager.black6,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () => Get.dialog(
                            const FinishMeetingDialog(),
                            barrierDismissible: false,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check_box_outlined,
                                size: 18.sp,
                                color: ColorManager.black6,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                'FinishMeeting'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: ColorManager.black6,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ]),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
