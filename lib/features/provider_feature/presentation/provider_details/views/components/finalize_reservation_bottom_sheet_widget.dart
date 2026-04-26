import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/widgets/button_widget.dart';
import '../../controllers/instructor_details_controller.dart';

class FinalizeReservationBottomSheetCustom extends StatelessWidget {
  const FinalizeReservationBottomSheetCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InstructorDetailsController>(
      builder: (controller) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 15.r,
            ),
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
                          'FinalizeReservation'.tr,
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
                          'SelectedTime'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: ColorManager.grey5,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          '${controller.startDate} | ${controller.selectedTime?.time}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: ColorManager.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.r, vertical: 12.r),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(11.r),
                              border: Border.all(color: ColorManager.grey6)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'MeetingDetails'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'OnlineMeeting'.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: ColorManager.grey5,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    '${controller.selectedTime?.meeting.inPersonPriceWithDiscountString}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: ColorManager.grey5,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'PersonMeeting'.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: ColorManager.grey5,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    '${controller.selectedTime?.meeting.inPersonPriceWithDiscountString}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: ColorManager.grey5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'ConductionType'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorManager.black,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(2.r),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(color: ColorManager.grey6)),
                          child: Container(
                            width: 1.sw,
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green,
                            ),
                            child: Text(
                              'Online'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15.sp, color: ColorManager.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'MeetingType'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorManager.black,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(2.r),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(color: ColorManager.grey6)),
                          child: Container(
                            width: 1.sw,
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                            ),
                            child: Text(
                              'Individual'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15.sp, color: ColorManager.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          'Description'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorManager.black,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomTextField(
                          keyboardType: TextInputType.text,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide:
                                const BorderSide(color: ColorManager.grey6),
                          ),
                          controller: controller.descCtrl,
                          onEditingComplete: () {
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ButtonWidget(
                          colorBtn:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                          isLoading: controller.isCreatingMeeting,
                          text: Text(
                            '${'AddCart'.tr} ${controller.conductionType.isNotEmpty && controller.meetingType.isNotEmpty ? controller.conductionType == 'in_person' ? '(${controller.selectedTime?.meeting.inPersonPriceWithDiscountString})' : '(${controller.selectedTime?.meeting.inPersonPriceWithDiscountString})' : ''}',
                            style: TextStyle(
                                fontSize: 15.sp, color: ColorManager.white),
                          ),
                          onPressed: controller.conductionType.isNotEmpty &&
                                  controller.meetingType.isNotEmpty
                              ? () {
                                  controller.createMeeting();
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
                      ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
