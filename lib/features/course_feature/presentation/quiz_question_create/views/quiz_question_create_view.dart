import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/services/user_service.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../../../../../core/widgets/simple_timer.dart';
import '../controllers/quiz_question_create_controller.dart';
import 'components/back_alert_dialog.dart';
import 'components/quiz_question_create_list_view.dart';

class QuizDetailsQuestionCreateView extends StatelessWidget {
  const QuizDetailsQuestionCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizQuestionCreateController>(
      builder: (controller) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: ColorManager.white13,
            appBar: AppBar(
              shape: const Border(
                bottom: BorderSide.none,
              ),
              centerTitle: true,
              title: Text(
                controller.typeQuestion == 'Result'
                    ? controller.result?.quiz?.title ?? ''
                    : controller.quiz?.title ?? '',
                style: TextManager.font16Text300W600.copyWith(
                  color: ColorManager.white,
                ),
              ),
              leadingWidth: 80,
              leading: CustomBackBtn(
                onPressed: () {
                  Get.dialog(
                    const BackAlertDialog(),
                    barrierDismissible: false,
                  );
                },
              ),
              backgroundColor: context.theme.primaryColor,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.r),
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.r),
                        bottomLeft: Radius.circular(15.r)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: SizedBox(
                          width: 100.w,
                          height: 100.h,
                          child: (controller.result?.quiz?.time ?? '0') ==
                                      '0' &&
                                  (controller.quiz?.time ?? '0') == '0'
                              ? Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: ColorManager.white,
                                      width: 6,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Unlimited'.tr,
                                    style: TextStyle(
                                      color: ColorManager.white,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : SimpleTimer(
                                  status: TimerStatus.start,
                                  duration: Duration(
                                    minutes: controller.typeQuestion == 'Result'
                                        ? (int.tryParse(controller
                                                .result!.quiz!.time) ??
                                            0)
                                        : (int.tryParse(
                                                controller.quiz?.time ?? '0') ??
                                            0),
                                  ),
                                  // controller: controller.timerController,
                                  timerStyle: TimerStyle.ring,

                                  onEnd: () => controller.handleTimerOnEnd(),
                                  valueListener:
                                      controller.timerValueChangeListener,
                                  backgroundColor: ColorManager.grey10,
                                  progressIndicatorColor: ColorManager.white,
                                  progressIndicatorDirection:
                                      TimerProgressIndicatorDirection.clockwise,
                                  progressTextCountDirection:
                                      TimerProgressTextCountDirection.countDown,
                                  displayProgressText:
                                      (controller.result?.quiz?.time ?? '0') !=
                                                  '0' ||
                                              (controller.quiz?.time ?? '0') !=
                                                  '0'
                                          ? true
                                          : false,
                                  progressTextStyle: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  strokeWidth: 6,
                                ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Questions'.tr,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.white,
                                ),
                              ),
                              Text(
                                controller.typeQuestion == 'Result'
                                    ? '${(controller.result?.quiz?.questions ?? []).isEmpty ? 0 : controller.indexQuestion}/${(controller.result?.quiz?.questions ?? []).length}'
                                    : '${(controller.quiz?.questions ?? []).isEmpty ? 0 : controller.indexQuestion}/${(controller.quiz?.questions ?? []).length}',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: ColorManager.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                                border: Border.all(
                                    color: ColorManager.white, width: 2.w)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 1, horizontal: 2),
                            child: LinearProgressIndicator(
                              minHeight: 3.h,
                              color: ColorManager.white,
                              backgroundColor: Colors.transparent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.r)),
                              value: controller.valueOfProgressBarQuestion,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Expanded(
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.typeQuestion == 'Result'
                        ? controller.result!.quiz!.questions.length
                        : (controller.quiz?.questions ?? []).length,
                    controller: controller.pageController,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (i) {
                      controller.indexQuestion = i + 1;
                      controller.refreshProgressQuestion();
                    },
                    itemBuilder: (context, index) {
                      return QuestionCreateWidget(
                        item: controller.typeQuestion == 'Result'
                            ? controller.result!.quiz!.questions[index]
                            : (controller.quiz?.questions ?? [])[index],
                        indexQuestion: index,
                      );
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar: controller.indexQuestion == 1 &&
                    (controller.typeQuestion == 'Result'
                        ? controller.result!.quiz!.questions.length < 2
                        : (controller.quiz?.questions ?? []).length < 2)
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
                      isLoading: controller.isStoreLoading,
                      colorBtn: ColorManager.red,
                      colorBorder: ColorManager.red,
                      colorBackground: ColorManager.red,
                      text: Text(
                        'Finish'.tr,
                        style: TextStyle(
                            fontSize: 13.sp, color: ColorManager.white),
                      ),
                      onPressed: () {
                        controller.storeResult();
                      },
                      width: 1.sw,
                      paddingHorizontal: 10,
                      paddingVertical: 10,
                      marginHorizontal: 5,
                      radius: 15,
                    ),
                  )
                : controller.indexQuestion == 1 &&
                        controller.indexQuestion !=
                            (controller.result?.quizReview ?? []).length
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.r, vertical: 10.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.r),
                              topLeft: Radius.circular(15.r)),
                          color: ColorManager.white,
                        ),
                        child: ButtonWidget(
                          colorBtn: UserService.to.isKsa.value
                              ? Colors.green[400]
                              : ColorManager.green,
                          colorBorder: UserService.to.isKsa.value
                              ? Colors.green[400]
                              : ColorManager.green,
                          colorBackground: UserService.to.isKsa.value
                              ? Colors.green[400]
                              : ColorManager.green,
                          text: Text(
                            'Next'.tr,
                            style: TextStyle(
                                fontSize: 13.sp, color: ColorManager.white),
                          ),
                          onPressed: () {
                            controller.pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                          },
                          width: 1.sw,
                          paddingHorizontal: 10,
                          paddingVertical: 10,
                          marginHorizontal: 5,
                          radius: 15,
                        ),
                      )
                    : controller.indexQuestion ==
                            (controller.typeQuestion == 'Result'
                                ? controller.result!.quiz!.questions.length
                                : controller.quiz!.questions.length)
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
                                    colorBtn: Colors.transparent,
                                    colorBorder: UserService.to.isKsa.value
                                        ? Colors.green[400]
                                        : ColorManager.green,
                                    text: Text(
                                      'Previous'.tr,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: UserService.to.isKsa.value
                                              ? Colors.green[400]
                                              : ColorManager.green),
                                    ),
                                    onPressed: () {
                                      controller.pageController.previousPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.ease);
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
                                    isLoading: controller.isStoreLoading,
                                    colorBtn: ColorManager.red,
                                    colorBorder: ColorManager.red,
                                    colorBackground: ColorManager.red,
                                    text: Text(
                                      'Finish'.tr,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: ColorManager.white),
                                    ),
                                    onPressed: () => controller.storeResult(),
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
                                Expanded(
                                  child: ButtonWidget(
                                    colorBtn: Colors.transparent,
                                    colorBorder: UserService.to.isKsa.value
                                        ? Colors.green[400]
                                        : ColorManager.green,
                                    text: Text(
                                      'Previous'.tr,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: UserService.to.isKsa.value
                                              ? Colors.green[400]
                                              : ColorManager.green),
                                    ),
                                    onPressed: () {
                                      controller.pageController.previousPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.ease);
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
                                    colorBackground: UserService.to.isKsa.value
                                        ? Colors.green[400]
                                        : ColorManager.green,
                                    text: Text(
                                      'Next'.tr,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: ColorManager.white),
                                    ),
                                    onPressed: () {
                                      controller.pageController.nextPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.ease);
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
          ),
        );
      },
    );
  }
}
