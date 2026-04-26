import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../controllers/meeting_details_controller.dart';

class InformationMeetingDetailsWidget extends StatelessWidget {
  const InformationMeetingDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeetingDetailsController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorManager.grey2,
                          radius: 17.r,
                          child: Icon(
                            Icons.calendar_month,
                            color: ColorManager.grey9,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'StartDate'.tr,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: ColorManager.grey9,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              DateFormat(
                                      'dd MMM yyyy',
                                      GetStorage()
                                              .read<String>('language_code') ??
                                          'EN')
                                  .format(DateTime.fromMillisecondsSinceEpoch(
                                      int.parse(controller.item!.date) * 1000)),
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorManager.grey2,
                          radius: 17.r,
                          child: Icon(
                            Icons.access_time_filled,
                            color: ColorManager.grey9,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Durations'.tr,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: ColorManager.grey9,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              '${DateFormat('hh:mma').parse(controller.item!.time.end ?? '0').difference(DateFormat('hh:mma').parse(controller.item!.time.start ?? '0')).inHours.toString()} ${'Hour'.tr}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorManager.grey2,
                          radius: 17.r,
                          child: Icon(
                            Icons.access_time_filled,
                            color: ColorManager.grey9,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'StartTime'.tr,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: ColorManager.grey9,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              controller.item!.time.start ?? '0',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorManager.grey2,
                          radius: 17.r,
                          child: Icon(
                            Icons.access_time_filled,
                            color: ColorManager.grey9,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'EndTime'.tr,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: ColorManager.grey9,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              controller.item!.time.end ?? '0',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorManager.grey2,
                          radius: 17.r,
                          child: Icon(
                            Icons.video_call,
                            color: ColorManager.grey9,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ConductionType'.tr,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: ColorManager.grey9,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              controller.item!.meeting.inPerson == '0'
                                  ? 'In-person'.tr
                                  : 'Online'.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorManager.grey2,
                          radius: 17.r,
                          child: Icon(
                            Icons.groups_rounded,
                            color: ColorManager.grey9,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MeetingType'.tr,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: ColorManager.grey9,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              int.parse(controller.item!.studentCount) > 0
                                  ? '${'Group'.tr} (${controller.item!.studentCount})'
                                  : 'Individual'.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorManager.grey2,
                          radius: 17.r,
                          child: Icon(
                            Icons.account_balance_wallet,
                            color: ColorManager.grey9,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Amount'.tr,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: ColorManager.grey9,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              '\$${controller.item!.amount}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorManager.grey2,
                          radius: 17.r,
                          child: Icon(
                            Icons.more_horiz,
                            color: ColorManager.grey9,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Status'.tr,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: ColorManager.grey9,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              controller.item!.status == 'canceled'
                                  ? 'Canceled'.tr
                                  : controller.item!.status == 'finished'
                                      ? 'Finished'.tr
                                      : 'Pending'.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: controller.item!.status == 'canceled'
                                    ? ColorManager.red
                                    : controller.item!.status == 'finished'
                                        ? context.theme.primaryColor
                                        : ColorManager.yellow,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
