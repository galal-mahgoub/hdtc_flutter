import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/widgets/button_widget.dart';
import '../../controller/courses_details_controller.dart';

class AddReviewBottomSheetCustom extends StatelessWidget {
  const AddReviewBottomSheetCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesDetailsController>(
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
                          'ReviewCourse'.tr,
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
                          'RateCourse'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: ColorManager.grey5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'ContentQuality'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorManager.grey5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                                child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: RatingBar(
                                itemSize: 25.r,
                                maxRating: 5.0,
                                initialRating: 0,
                                itemCount: 5,
                                direction: Axis.horizontal,
                                ratingWidget: RatingWidget(
                                  full: const Icon(
                                    Icons.star,
                                    color: ColorManager.yellow,
                                  ),
                                  empty: const Icon(
                                    Icons.star,
                                    color: ColorManager.grey5,
                                  ),
                                  half: const Icon(Icons.star),
                                ),
                                onRatingUpdate: (rating) {
                                  controller.contentQualityReview = rating;
                                  controller.update();
                                },
                              ),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'InstructorSkills'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorManager.grey5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                                child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: RatingBar(
                                itemSize: 25.r,
                                maxRating: 5.0,
                                initialRating: 0,
                                itemCount: 5,
                                direction: Axis.horizontal,
                                ratingWidget: RatingWidget(
                                  full: const Icon(
                                    Icons.star,
                                    color: ColorManager.yellow,
                                  ),
                                  empty: const Icon(
                                    Icons.star,
                                    color: ColorManager.grey5,
                                  ),
                                  half: const Icon(Icons.star),
                                ),
                                onRatingUpdate: (rating) {
                                  controller.instructorSkillsReview = rating;
                                  controller.update();
                                },
                              ),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'PurchaseWorth'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorManager.grey5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                                child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: RatingBar(
                                itemSize: 25.r,
                                maxRating: 5.0,
                                initialRating: 0,
                                itemCount: 5,
                                direction: Axis.horizontal,
                                ratingWidget: RatingWidget(
                                  full: const Icon(
                                    Icons.star,
                                    color: ColorManager.yellow,
                                  ),
                                  empty: const Icon(
                                    Icons.star,
                                    color: ColorManager.grey5,
                                  ),
                                  half: const Icon(Icons.star),
                                ),
                                onRatingUpdate: (rating) {
                                  controller.purchaseWorthReview = rating;
                                  controller.update();
                                },
                              ),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'SupportQuality'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: ColorManager.grey5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                                child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: RatingBar(
                                itemSize: 25.r,
                                maxRating: 5.0,
                                initialRating: 0,
                                itemCount: 5,
                                direction: Axis.horizontal,
                                ratingWidget: RatingWidget(
                                  full: const Icon(
                                    Icons.star,
                                    color: ColorManager.yellow,
                                  ),
                                  empty: const Icon(
                                    Icons.star,
                                    color: ColorManager.grey5,
                                  ),
                                  half: const Icon(Icons.star),
                                ),
                                onRatingUpdate: (rating) {
                                  controller.supportQualityReview = rating;
                                  controller.update();
                                },
                              ),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Form(
                          key: controller.formReview,
                          child: CustomTextField(
                            keyboardType: TextInputType.text,
                            hintText: 'MessageBody'.tr,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.r),
                              borderSide:
                                  const BorderSide(color: ColorManager.grey6),
                            ),
                            controller: controller.descriptionReviewController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'EnterMessageBody'.tr;
                              }
                              return null;
                            },
                            onEditingComplete: () {
                              FocusScope.of(context).unfocus();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ButtonWidget(
                          isLoading: controller.isReviewLoading,
                          colorBtn:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                          text: Text(
                            'SendReview'.tr,
                            style: TextStyle(
                                fontSize: 15.sp, color: ColorManager.white),
                          ),
                          onPressed: () => controller.sendReview(),
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
