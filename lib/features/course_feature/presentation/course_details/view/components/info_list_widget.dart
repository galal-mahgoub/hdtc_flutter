import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';
import '../../controller/courses_details_controller.dart';

class InfoListWidget extends StatelessWidget {
  const InfoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesDetailsController>(
      builder: (controller) {
        return SizedBox(
          height: 70.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.lengthInfoList.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 1.sw - 100.w,
                  margin: EdgeInsetsDirectional.only(end: 10.r),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.r,
                    vertical: 10.r,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                            color: controller.lengthInfoList[index] ==
                                    'Downloadable'.tr
                                ? UserService.to.isKsa.value
                                    ? Colors.green[400]
                                    : ColorManager.green
                                : controller.lengthInfoList[index] ==
                                        'Certificate'.tr
                                    ? ColorManager.orange
                                    : controller.lengthInfoList[index] ==
                                            'Quiz'.tr
                                        ? ColorManager.green5
                                        : controller.lengthInfoList[index] ==
                                                'ContentAccess'.tr
                                            ? UserService.to.isKsa.value
                                                ? Colors.green[400]
                                                : ColorManager.green
                                            : controller.lengthInfoList[
                                                        index] ==
                                                    'Courses'.tr
                                                ? ColorManager.blue1
                                                : null,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Icon(
                            controller.lengthInfoList[index] ==
                                    'Downloadable'.tr
                                ? FontAwesomeIcons.download
                                : controller.lengthInfoList[index] ==
                                        'Certificate'.tr
                                    ? FontAwesomeIcons.certificate
                                    : controller.lengthInfoList[index] ==
                                            'Quiz'.tr
                                        ? Icons.done_sharp
                                        : controller.lengthInfoList[index] ==
                                                'ContentAccess'.tr
                                            ? Icons.calendar_month
                                            : controller.lengthInfoList[
                                                        index] ==
                                                    'Courses'.tr
                                                ? Icons.play_circle_outline
                                                : null,
                            size: 20.sp,
                            color: ColorManager.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.lengthInfoList[index] ==
                                      'ContentAccess'.tr
                                  ? controller.course!.accessDays == '0'
                                      ? 'Unlimited'.tr
                                      : controller.course!.accessDays.toString()
                                  : controller.lengthInfoList[index] ==
                                          'Courses'.tr
                                      ? '0'
                                      : controller.lengthInfoList[index],
                              maxLines: 1,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13.sp,
                                  color: ColorManager.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              controller.lengthInfoList[index] ==
                                      'Downloadable'.tr
                                  ? 'Content'.tr
                                  : controller.lengthInfoList[index] ==
                                          'Certificate'.tr
                                      ? 'Included'.tr
                                      : controller.lengthInfoList[index] ==
                                              'Quiz'.tr
                                          ? 'Included'.tr
                                          : controller.lengthInfoList[index] ==
                                                  'ContentAccess'.tr
                                              ? 'ContentAccess'.tr
                                              : controller.lengthInfoList[
                                                          index] ==
                                                      'Courses'.tr
                                                  ? 'Courses'.tr
                                                  : 'Included'.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorManager.grey4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
