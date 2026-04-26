import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/services/user_service.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../../../domain/entities/quiz_review.dart';
import '../controllers/quiz_question_controller.dart';
import 'components/quiz_question_view_list_view.dart';

class QuizQuestionView extends StatelessWidget {
  const QuizQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizQuestionController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.white13,
          appBar: AppBar(
            shape: const Border(
              bottom: BorderSide.none,
            ),
            centerTitle: true,
            title: Text(
              controller.result!.quiz!.title,
              style: TextManager.font16Text300W600.copyWith(
                color: ColorManager.white,
              ),
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
            backgroundColor: context.theme.primaryColor,
          ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  Text(
                    'QuizReview'.tr,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.white,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'compare your answer with correct ones.'.tr,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorManager.white,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
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
                            '${controller.indexQuestion}/${controller.result!.quiz!.questions.length}',
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
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
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
                itemCount: controller.result!.quiz!.questions.length,
                controller: controller.pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (i) {
                  controller.indexQuestion = i + 1;
                  controller.refreshProgressQuestion();
                },
                itemBuilder: (context, index) {
                  return QuestionViewWidget(
                    item: controller.result!.quizReview.length >= index + 1
                        ? controller.result!.quizReview[index]
                        : QuizReview(
                            title:
                                controller.result!.quiz!.questions[index].title,
                            type:
                                controller.result!.quiz!.questions[index].type,
                            grade:
                                controller.result!.quiz!.questions[index].grade,
                            id: int.parse(
                                controller.result!.quiz!.questions[index].id),
                            createdAt: controller
                                .result!.quiz!.questions[index].createdAt,
                            answers: controller
                                .result!.quiz!.questions[index].answers,
                          ),
                  );
                },
              ),
            ),
          ]),
          bottomNavigationBar: controller.result!.quizReview.length == 1
              ? null
              : Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.r),
                        topLeft: Radius.circular(15.r)),
                    color: ColorManager.white,
                  ),
                  child: controller.indexQuestion == 1 &&
                          controller.indexQuestion !=
                              controller.result!.quizReview.length
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
                              controller.result!.quizReview.length
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
                                            duration: const Duration(
                                                milliseconds: 300),
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
                                      colorBackground:
                                          UserService.to.isKsa.value
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
                                            duration: const Duration(
                                                milliseconds: 300),
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
