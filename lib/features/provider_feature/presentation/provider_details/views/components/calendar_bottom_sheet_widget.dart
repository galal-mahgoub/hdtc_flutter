import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/widgets/button_widget.dart';
import '../../controllers/instructor_details_controller.dart';
import 'finalize_reservation_bottom_sheet_widget.dart';

class CalendarBottomSheetCustom extends StatelessWidget {
  const CalendarBottomSheetCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InstructorDetailsController>(
      builder: (controller) {
        return Container(
          padding: EdgeInsets.only(
            top: 15.r,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () => Get.back(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsetsDirectional.only(end: 10.r),
                          padding: EdgeInsets.all(15.r),
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.r)),
                          ),
                          child: Icon(
                            Icons.close,
                            size: 22.sp,
                            color: ColorManager.black,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'PickDate'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        controller.startDate,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: ColorManager.black,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '${controller.countMeeting} ${'MeetingTimesAvailable'.tr}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: ColorManager.grey5,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SfDateRangePicker(
                        onSelectionChanged:
                            controller.onSelectionCalendarChanged,
                        selectionMode: DateRangePickerSelectionMode.single,
                        initialSelectedDate: DateTime.now(),
                        minDate: DateTime.now(),
                        maxDate: DateTime(DateTime.now().year + 1,
                            DateTime.now().month + 1, 0),
                        selectionColor: context.theme.primaryColor,
                        showNavigationArrow: true,
                        headerStyle: const DateRangePickerHeaderStyle(
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(11.r),
                            border: Border.all(color: ColorManager.grey6)),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.r),
                              decoration:  BoxDecoration(
                                color: context.theme.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.access_time_filled,
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
                                    'Important'.tr,
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
                                    '${'TimeSlots'.tr} ${controller.provider?.meeting?.timeZone}',
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
                        height: 15.h,
                      ),
                      Text(
                        'PickTime'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      controller.isConsultantDatesLoading
                          ?  Center(
                              child: CircularProgressIndicator(
                                color: context.theme.primaryColor,
                              ),
                            )
                          : controller.times.isNotEmpty
                              ? Wrap(
                                  children: List.generate(
                                    controller.times.length,
                                    (index) => InkWell(
                                      onTap: () =>
                                          controller.selectPickUpTime(index),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 7.r, horizontal: 5.r),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.r, vertical: 5.r),
                                        decoration: BoxDecoration(
                                          color: controller.selectedTime?.id ==
                                                  controller.times[index].id
                                              ? context.theme.primaryColor
                                              : ColorManager.white11,
                                          border: Border.all(
                                              color: controller
                                                          .selectedTime?.id ==
                                                      controller.times[index].id
                                                  ? context.theme.primaryColor
                                                  : ColorManager.grey4,
                                              width: 1),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.r),
                                          ),
                                        ),
                                        child: Text(
                                          controller.times[index].time,
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: controller
                                                        .selectedTime?.id ==
                                                    controller.times[index].id
                                                ? ColorManager.white
                                                : ColorManager.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: SizedBox(
                                    width: 200.w,
                                    child: Text(
                                      'SelectAnotherDate'.tr,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: ColorManager.grey5,
                                      ),
                                    ),
                                  ),
                                ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ButtonWidget(
                        colorBtn:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                        text: Text(
                          'FinalizeReservation'.tr,
                          style: TextStyle(
                              fontSize: 15.sp, color: ColorManager.white),
                        ),
                        onPressed: controller.selectedTime != null
                            ? () {
                                Get.bottomSheet(
                                  const FinalizeReservationBottomSheetCustom(),
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                );
                              }
                            : null,
                        width: 1.sw,
                        paddingHorizontal: 10,
                        paddingVertical: 10,
                        marginHorizontal: 5,
                        radius: 10,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
