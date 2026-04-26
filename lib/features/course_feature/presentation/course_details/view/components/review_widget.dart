import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:hdtc_on/core/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/review.dart';
import '../../controller/courses_details_controller.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesDetailsController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16).r,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                ),
                child: Column(
                  children: [
                    Text(
                      (controller.course!.rate ?? 0).toStringAsFixed(1),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: ColorManager.black,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomRatingBar(
                      value: controller.course!.rate ?? 0,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
                      decoration: BoxDecoration(
                        color: ColorManager.white11,
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                      ),
                      child: Text(
                        '${controller.course!.reviews!.length} ${'Reviews'.tr}',
                        style: TextStyle(
                            fontSize: 12.sp, color: ColorManager.grey4),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'ContentQuality'.tr,
                          style: TextStyle(
                              fontSize: 12.sp, color: ColorManager.grey4),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: LinearProgressIndicator(
                            value: controller.course!.rateType!.contentQuality /
                                5.0,
                            backgroundColor: ColorManager.white,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              ColorManager.yellow,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'InstructorSkills'.tr,
                          style: TextStyle(
                              fontSize: 12.sp, color: ColorManager.grey4),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: LinearProgressIndicator(
                            value:
                                controller.course!.rateType!.instructorSkills /
                                    5.0,
                            backgroundColor: ColorManager.white,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                ColorManager.yellow),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'PurchaseWorth'.tr,
                          style: TextStyle(
                              fontSize: 12.sp, color: ColorManager.grey4),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: LinearProgressIndicator(
                            value: controller.course!.rateType!.purchaseWorth /
                                5.0,
                            backgroundColor: ColorManager.white,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              ColorManager.yellow,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'SupportQuality'.tr,
                          style: TextStyle(
                              fontSize: 12.sp, color: ColorManager.grey4),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: LinearProgressIndicator(
                            value: controller.course!.rateType!.supportQuality /
                                5.0,
                            backgroundColor: ColorManager.white,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                ColorManager.yellow),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              if (controller.course!.reviews != null)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.course!.reviews!.length,
                  itemBuilder: (context, index) {
                    return ReviewCard(
                      review: controller.course!.reviews![index],
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 40.r,
                width: 40.r,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(80.r)),
                  child: CustomImage(
                    path: review.user.avatar.isNotEmpty
                        ? review.user.avatar
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
                    review.user.fullName,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: ColorManager.black,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  CustomRatingBar(
                    value: double.tryParse(review.rate) ?? 0,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            review.description,
            style: TextStyle(
              fontSize: 11.sp,
              color: ColorManager.grey5,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            DateFormat('dd MMM yyyy', Get.locale?.languageCode ?? 'EN').format(
                DateTime.fromMillisecondsSinceEpoch(
                    (int.tryParse(review.createdAt) ?? 0) * 1000)),
            style: TextStyle(
              fontSize: 10.sp,
              color: ColorManager.grey5,
            ),
          ),
        ],
      ),
    );
  }
}
