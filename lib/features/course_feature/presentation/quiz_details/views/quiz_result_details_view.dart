import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/services/user_service.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../controllers/quiz_result_details_controller.dart';

class QuizResultDetailsView extends StatelessWidget {
  const QuizResultDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizResultDetailsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.white13,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'QuizDetails'.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                height: 110.h,
                width: 110.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: controller.result!.quiz!.authStatus == 'passed'
                        ? context.theme.primaryColor
                        : controller.result!.quiz!.authStatus == 'waiting'
                            ? ColorManager.yellow
                            : ColorManager.red,
                    width: 13.w,
                  ),
                ),
                padding: EdgeInsets.all(8.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      controller.result!.userGrade.toString(),
                      style: TextStyle(
                        color: ColorManager.black,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'YourGrade'.tr,
                      style: TextStyle(
                        color: ColorManager.grey5,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                controller.result!.quiz!.authStatus == 'passed'
                    ? 'PassedQuiz'.tr
                    : controller.result!.quiz!.authStatus == 'waiting'
                        ? 'WaitResult'.tr
                        : 'FailedQuiz'.tr,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.black,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 35.r),
                child: Text(
                  controller.result!.quiz!.authStatus == 'passed'
                      ? 'PassedQuizDesc'.tr
                      : controller.result!.quiz!.authStatus == 'waiting'
                          ? 'waitFinalResultDesc'.tr
                          : 'FailedQuizDesc'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: ColorManager.grey,
                  ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'TotalMark'.tr,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: ColorManager.grey9,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                controller.result!.quiz!.totalMark.toString(),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'PassMark'.tr,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: ColorManager.grey9,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                controller.result!.quiz!.passMark.toString(),
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
                              Icons.person,
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
                                'YourGrade'.tr,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: ColorManager.grey9,
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                controller.result!.userGrade.toString(),
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
                                controller.result!.quiz!.authStatus == 'passed'
                                    ? 'passed'.tr
                                    : controller.result!.quiz!.authStatus ==
                                            'waiting'
                                        ? 'waiting'.tr
                                        : 'failed'.tr,
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
            ]),
          ),
          bottomNavigationBar: controller.result!.quiz!.authStatus == 'waiting'
              ? Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.r),
                        topLeft: Radius.circular(15.r)),
                    color: ColorManager.white,
                  ),
                  child: ButtonWidget(
                    colorBtn: Colors.transparent,
                    colorBorder: UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green,
                    colorBackground: UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green,
                    text: Text(
                      'BackQuizzes'.tr,
                      style:
                          TextStyle(fontSize: 13.sp, color: ColorManager.white),
                    ),
                    onPressed: () {
                      Get.back(result: true);
                    },
                    width: 1.sw,
                    paddingHorizontal: 10,
                    paddingVertical: 10,
                    marginHorizontal: 5,
                    radius: 15,
                  ),
                )
              : controller.result!.quiz!.authStatus == 'passed'
                  ? Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.r, vertical: 10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.r),
                            topLeft: Radius.circular(15.r)),
                        color: ColorManager.white,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ButtonWidget(
                              colorBtn: UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green,
                              colorBorder:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                              colorBackground:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                              text: Text(
                                'ReviewAnswers'.tr,
                                style: TextStyle(
                                    fontSize: 13.sp, color: ColorManager.white),
                              ),
                              onPressed: () {
                                Get.toNamed(
                                  Routes.quizDetailsQuestionView,
                                  arguments: {
                                    'quizResultDetails': controller.result
                                  },
                                );
                              },
                              width: 1.sw,
                              paddingHorizontal: 10,
                              paddingVertical: 10,
                              marginHorizontal: 5,
                              radius: 15,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: ButtonWidget(
                              colorBtn: Colors.transparent,
                              colorBorder:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                              text: Text(
                                'BackQuizzes'.tr,
                                style: TextStyle(
                                    fontSize: 13.sp, color:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green),
                              ),
                              onPressed: () {
                                Get.back(result: true);
                              },
                              width: 1.sw,
                              paddingHorizontal: 10,
                              paddingVertical: 10,
                              marginHorizontal: 5,
                              radius: 15,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.r, vertical: 10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.r),
                            topLeft: Radius.circular(15.r)),
                        color: ColorManager.white,
                      ),
                      child: Row(
                        children: [
                          if (controller.result!.quiz!.authCanStart!)
                            Expanded(
                              child: ButtonWidget(
                                colorBtn: Colors.transparent,
                                colorBorder:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                                text: Text(
                                  'Retry'.tr,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green),
                                ),
                                onPressed: () {
                                  Get.toNamed(
                                    Routes.quizDetailsQuestionCreate,
                                    arguments: {
                                      'quizResultDetails': controller.result!,
                                      'type': 'Result'
                                    },
                                  )?.then((value) {
                                    if (value != null) {
                                      controller.result = value;
                                      controller.update();
                                    }
                                  });
                                },
                                width: 1.sw,
                                paddingHorizontal: 10,
                                paddingVertical: 10,
                                marginHorizontal: 5,
                                radius: 15,
                              ),
                            ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: ButtonWidget(
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
                                'BackQuizzes'.tr,
                                style: TextStyle(
                                    fontSize: 13.sp, color: ColorManager.white),
                              ),
                              onPressed: () {
                                Get.back(result: true);
                              },
                              width: 1.sw,
                              paddingHorizontal: 10,
                              paddingVertical: 10,
                              marginHorizontal: 5,
                              radius: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
        );
      },
    );
  }
}
