import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/languages/app_translations.dart';
import '../../../../../../core/routes/app_pages.dart';
import '../../../../../../core/widgets/empty_widget.dart';
import '../../../../domain/entities/quiz.dart';
import '../../controllers/new_learning_page_controller.dart';

class QuizListNewLearningPageWidget extends StatelessWidget {
  const QuizListNewLearningPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewLearningPageController>(
      builder: (controller) {
        return controller.course.quizzes!.isNotEmpty
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.course.quizzes!.length,
                itemBuilder: (context, index) {
                  final Quiz quiz = controller.course.quizzes![index];
                  return InkWell(
                    onTap: () {
                      if (quiz.authStatus == 'not_participated') {
                        Get.toNamed(Routes.quizParticipatedDetails, arguments: {
                          'quizParticipatedDetails': quiz,
                        });
                      } else {
                        controller.getQuizResult(quiz.id.toString());
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        color: ColorManager.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              color: ColorManager.green5,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(13.r),
                            ),
                            child: Icon(
                              Icons.done,
                              size: 35.sp,
                              color: ColorManager.white,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.r),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  quiz.title,
                                  maxLines: 1,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 13.sp,
                                      color: ColorManager.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  '${quiz.questionCount}${'Questions'.tr} | ${quiz.time}${'Minutes'.tr}',
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: ColorManager.grey5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            : SizedBox(
                height: Get.height / 2,
                child: Center(
                  child: EmptyWidget(
                    message: LocaleKeys.noQuizzesAvailable.tr,
                  ),
                ),
              );
      },
    );
  }
}
