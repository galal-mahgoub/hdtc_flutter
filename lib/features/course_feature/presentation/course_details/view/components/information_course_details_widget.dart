import 'package:carousel_slider/carousel_slider.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/courses_details_controller.dart';
import 'faqs_widget.dart';
import 'info_list_widget.dart';
import 'prerequisites_widget.dart';
import '../../../../../../core/widgets/text_wrapper.dart';

class InformationCourseDetailsWidget extends StatelessWidget {
  const InformationCourseDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesDetailsController>(
      builder: (controller) {
        return SizedBox(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (controller.lengthInfoList.isNotEmpty) ...[
                  const InfoListWidget(),
                  16.verticalSpace,
                ],
                TextWrapper(
                  text: controller.course!.description ?? '',
                ),
                SizedBox(
                  height: 16.h,
                ),
                Column(
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
                                  Icons.person,
                                  color: ColorManager.grey9,
                                  size: 18.sp,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Students'.tr,
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: ColorManager.grey9,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    controller.course!.studentsCount.toString(),
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
                          width: 8.w,
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
                                width: 8.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Chapters'.tr,
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: ColorManager.grey9,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    controller.course!.filesCount.toString(),
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
                      height: 8.h,
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
                                  Icons.calendar_month,
                                  color: ColorManager.grey9,
                                  size: 18.sp,
                                ),
                              ),
                              SizedBox(
                                width: 8.w,
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
                                    DateFormat('dd MMM yyyy',
                                            Get.locale?.languageCode ?? 'EN')
                                        .format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                int.parse(controller.course!
                                                            .createdAt ??
                                                        '0') *
                                                    1000)),
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
                          width: 8.w,
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
                                width: 8.w,
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
                                    '${Utils.formatDuration(controller.course!.duration.toString())} ${'Hours'.tr}',
                                    style: TextStyle(
                                      fontSize: 13.sp,
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
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.course!.faqs!.length,
                  itemBuilder: (context, index) => FaqsWidget(
                    faq: controller.course!.faqs![index],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                if (controller.course!.prerequisites!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Prerequisites'.tr,
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: ColorManager.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.r),
                        child: CarouselSlider.builder(
                          itemCount: controller.course!.prerequisites!.length,
                          itemBuilder: (BuildContext context, index,
                                  int pageViewIndex) =>
                              InkWell(
                            onTap: () {},
                            child: PrerequisitesWidget(
                              prerequisite:
                                  controller.course!.prerequisites![index],
                            ),
                          ),
                          options: CarouselOptions(
                            height: 180.h,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            scrollDirection: Axis.horizontal,
                            enlargeCenterPage: true,
                            autoPlay: false,
                            reverse: false,
                            enableInfiniteScroll: false,
                            viewportFraction: 0.98,
                            onPageChanged: (index, reason) {},
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          controller.course!.prerequisites!.length,
                          (position) => Padding(
                            padding: EdgeInsets.only(right: 8.r),
                            child: Container(
                              width: position ==
                                      controller.currentIndexSliderPrerequisites
                                  ? 21.w
                                  : 10.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                shape: controller
                                            .currentIndexSliderPrerequisites ==
                                        position
                                    ? BoxShape.rectangle
                                    : BoxShape.circle,
                                borderRadius: controller
                                            .currentIndexSliderPrerequisites ==
                                        position
                                    ? BorderRadius.circular(7.r)
                                    : null,
                                color: controller
                                            .currentIndexSliderPrerequisites ==
                                        position
                                    ? context.theme.primaryColor
                                    : ColorManager.grey1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
