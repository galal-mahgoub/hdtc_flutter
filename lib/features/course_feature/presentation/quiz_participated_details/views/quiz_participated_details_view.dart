import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/services/user_service.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../controllers/quiz_participated_details_controller.dart';

class QuizParticipatedDetailsView extends StatelessWidget {
  const QuizParticipatedDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizParticipatedDetailsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.white13,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Quiz Details'.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: CustomBackBtn(
              onPressed: () {
                Get.back(result: true);
              },
            ),
          ),
          body: controller.quiz == null
              ? const SizedBox()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.r),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          controller.quiz!.title,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.black,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          controller.quiz!.course.title,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorManager.grey4,
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        SizedBox(
                          width: 1.sw,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 130.r,
                                width: 130.r,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.r),
                                  child: CustomImage(
                                    path:
                                        controller.quiz!.course.image.isNotEmpty
                                            ? controller.quiz!.course.image
                                            : null,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                controller.quiz!.authStatus ==
                                        'not_participated'
                                    ? 'NotParticipated'.tr
                                    : controller.quiz!.authStatus == 'passed'
                                        ? 'You Passed the quiz'.tr
                                        : controller.quiz!.authStatus ==
                                                'waiting'
                                            ? 'Wait for final result'.tr
                                            : 'You failed the quiz'.tr,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.black,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                controller.quiz!.authStatus ==
                                        'not_participated'
                                    ? 'NotParticipated'.tr
                                    : controller.quiz!.authStatus == 'passed'
                                        ? 'PassedQuizDesc'.tr
                                        : controller.quiz!.authStatus ==
                                                'waiting'
                                            ? 'waitFinalResultDesc'.tr
                                            : 'FailedQuizDesc'.tr,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: ColorManager.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.r),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: ColorManager.grey2,
                                      radius: 17.r,
                                      child: Icon(
                                        Icons.settings,
                                        color: ColorManager.grey9,
                                        size: 18.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Mark'.tr,
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            color: ColorManager.grey9,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Text(
                                          controller.quiz!.totalMark.toString(),
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
                                        Icons.done,
                                        color: ColorManager.grey9,
                                        size: 18.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Pass Mark'.tr,
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            color: ColorManager.grey9,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Text(
                                          controller.quiz!.passMark.toString(),
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
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.r),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: ColorManager.grey2,
                                      radius: 17.r,
                                      child: Icon(
                                        Icons.add_box_rounded,
                                        color: ColorManager.grey9,
                                        size: 18.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Attempts'.tr,
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            color: ColorManager.grey9,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Text(
                                          controller.quiz?.attempt ?? '0',
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Time'.tr,
                                          style: TextStyle(
                                            fontSize: 11.sp,
                                            color: ColorManager.grey9,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Text(
                                          '${controller.quiz!.time} ${'Minutes'.tr}',
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
                        ),
                      ],
                    ),
                  ),
                ),
          bottomNavigationBar: controller.quiz == null
              ? const SizedBox()
              : Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.r),
                        topLeft: Radius.circular(15.r)),
                    color: ColorManager.white,
                  ),
                  child: ButtonWidget(
                    isLoading: controller.isStartingQuiz,
                    colorBtn: UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green,
                    colorBorder: UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green,
                    colorBackground:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                    text: Text(
                      'Start'.tr,
                      style:
                          TextStyle(fontSize: 16.sp, color: ColorManager.white),
                    ),
                    onPressed: () => controller.startQuiz(),
                    width: 1.sw,
                    paddingHorizontal: 10,
                    paddingVertical: 10,
                    marginHorizontal: 5,
                    radius: 15,
                  ),
                ),
        );
      },
    );
  }
}
