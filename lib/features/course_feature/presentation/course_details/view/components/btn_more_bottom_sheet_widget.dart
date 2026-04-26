import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/routes/app_pages.dart';
import '../../../../../../core/services/user_service.dart';
import '../../controller/courses_details_controller.dart';
import 'report_bottom_sheet_widget.dart';

class BtnMoreBottomSheetCustom extends StatelessWidget {
  const BtnMoreBottomSheetCustom({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesDetailsController>(
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
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'ClassOptions'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: ColorManager.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            InkWell(
                              onTap: () {
                                if (UserService.to.currentUser.value != null) {
                                  Add2Calendar.addEvent2Cal(
                                    Utils.buildEvent(title: title),
                                  );
                                } else {
                                  Get.toNamed(Routes.login);
                                }
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
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () {
                            if (UserService.to.currentUser.value != null) {
                              controller.addFavourite();
                            } else {
                              Get.toNamed(Routes.login);
                            }
                          },
                          child: Row(
                            children: [
                              Icon(
                                controller.course!.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 18.sp,
                                color: ColorManager.black6,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                controller.course!.isFavorite
                                    ? 'RemoveFavourites'.tr
                                    : 'AddFavourites'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: ColorManager.black6,
                                ),
                              ),
                              16.horizontalSpace,
                              if (controller.isAddFavLoading)
                                const SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: CircularProgressIndicator(
                                    color: ColorManager.yellow,
                                  ),
                                )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                if (UserService.to.currentUser.value != null) {
                                  controller.reasonReportController.text = '';

                                  Get.bottomSheet(
                                    const ReportBottomSheetCustom(),
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                  );
                                } else {
                                  await Get.toNamed(Routes.login);
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.report_gmailerrorred,
                                    size: 18.sp,
                                    color: ColorManager.black6,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'Report'.tr,
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
                          ],
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
