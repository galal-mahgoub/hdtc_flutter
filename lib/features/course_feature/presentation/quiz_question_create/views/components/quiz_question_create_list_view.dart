import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:hdtc_on/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../domain/entities/question.dart';
import '../../../../domain/entities/question_store.dart';
import '../../controllers/quiz_question_create_controller.dart';

class QuestionCreateWidget extends StatelessWidget {
  const QuestionCreateWidget(
      {super.key, required this.item, required this.indexQuestion});

  final Question item;
  final int indexQuestion;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizQuestionCreateController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                item.title,
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
                '${'Grade'.tr} ${item.grade}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorManager.grey5,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              item.type == 'descriptive'
                  ? CustomTextField(
                      hintText: 'Answer'.tr,
                      keyboardType: TextInputType.emailAddress,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorManager.grey2, width: 0.5),
                      ),
                      onChanged: (value) {
                        controller.questionStore[indexQuestion] = QuestionStore(
                          grade: controller.questionStore[indexQuestion].grade,
                          idQuestion: controller
                              .questionStore[indexQuestion].idQuestion,
                          idAnswer: value,
                          value: value,
                          index: 0,
                        );
                        Get.log(
                            'questionStore******2****${controller.questionStore}');
                      })
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          bool isSelect =
                              controller.questionStore[indexQuestion].index ==
                                  index;
                          return InkWell(
                            onTap: () {
                              if (isSelect) {
                                controller.questionStore[indexQuestion] =
                                    QuestionStore(
                                  grade: controller
                                      .questionStore[indexQuestion].grade,
                                  idQuestion: controller
                                      .questionStore[indexQuestion].idQuestion,
                                  idAnswer: '',
                                  value: '',
                                  index: -1,
                                );
                              } else {
                                controller.questionStore[indexQuestion] =
                                    QuestionStore(
                                  grade: controller
                                      .questionStore[indexQuestion].grade,
                                  idQuestion: controller
                                      .questionStore[indexQuestion].idQuestion,
                                  idAnswer: item.answers[index].id,
                                  value: item.answers[index].title.isNotEmpty
                                      ? item.answers[index].title
                                      : item.answers[index].image.isNotEmpty
                                          ? item.answers[index].image
                                          : '',
                                  index: index,
                                );
                              }
                              controller.update();
                            },
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.r),
                            ),
                            child: Container(
                              // height: 130.h,
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 8,
                              ),
                              decoration: BoxDecoration(
                                // color: ColorManager.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.r),
                                ),
                                // border: isSelect
                                //     ? Border.all(
                                //         color: ColorManager.green, width: 1.w)
                                //     : null,
                              ),
                              child: Row(
                                children: [
                                  item.answers[index].title.isNotEmpty
                                      ? Expanded(
                                          child: Text(
                                            '${index + 1}. ${item.answers[index].title}',
                                            // textAlign: TextAlign.center,
                                            maxLines: 4,
                                            style: TextStyle(
                                              color: ColorManager.black,
                                              fontSize: 12.sp,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )
                                      : item.answers[index].image.isNotEmpty
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.r),
                                              child: CustomImage(
                                                path: item.answers[index].image,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : const SizedBox(),
                                  Radio(
                                    activeColor: UserService.to.isKsa.value
                                        ? Colors.green[400]
                                        : ColorManager.green,
                                    value: isSelect,
                                    groupValue: true,
                                    onChanged: (value) {
                                      if (isSelect) {
                                        controller
                                                .questionStore[indexQuestion] =
                                            QuestionStore(
                                          grade: controller
                                              .questionStore[indexQuestion]
                                              .grade,
                                          idQuestion: controller
                                              .questionStore[indexQuestion]
                                              .idQuestion,
                                          idAnswer: '',
                                          value: '',
                                          index: -1,
                                        );
                                      } else {
                                        controller
                                                .questionStore[indexQuestion] =
                                            QuestionStore(
                                          grade: controller
                                              .questionStore[indexQuestion]
                                              .grade,
                                          idQuestion: controller
                                              .questionStore[indexQuestion]
                                              .idQuestion,
                                          idAnswer: item.answers[index].id,
                                          value: item.answers[index].title
                                                  .isNotEmpty
                                              ? item.answers[index].title
                                              : item.answers[index].image
                                                      .isNotEmpty
                                                  ? item.answers[index].image
                                                  : '',
                                          index: index,
                                        );
                                      }
                                      controller.update();
                                    },
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        // separatorBuilder: (context, index) => 16.verticalSpace,
                        itemCount: item.answers.length,
                      ),
                      // AlignedGridView.count(
                      //   crossAxisSpacing: 10.w,
                      //   mainAxisSpacing: 15.h,
                      //   crossAxisCount: 2,
                      //   itemCount: item.answers.length,
                      //   itemBuilder: (context, index) {

                      //   },
                      // ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
