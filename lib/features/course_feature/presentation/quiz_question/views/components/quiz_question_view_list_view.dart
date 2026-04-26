import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:hdtc_on/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../domain/entities/quiz_review.dart';

class QuestionViewWidget extends StatelessWidget {
  const QuestionViewWidget({
    super.key,
    required this.item,
  });

  final QuizReview item;

  @override
  Widget build(BuildContext context) {
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
                  enabled: false,
                  hintText: 'Answer'.tr,
                  keyboardType: TextInputType.emailAddress,
                  enabledBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorManager.grey2, width: 0.5),
                  ),
                  controller:
                      TextEditingController(text: item.userAnswer.answer))
              : Expanded(
                  child: AlignedGridView.count(
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 15.h,
                    crossAxisCount: 2,
                    itemCount: item.answers.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 130.h,
                        padding: EdgeInsets.all(2.r),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          ),
                          border: Border.all(
                            color: item.answers[index].id ==
                                    item.multipleCorrectAnswer.id
                                ? UserService.to.isKsa.value
                                    ? Colors.green[400]!
                                    : ColorManager.green
                                : item.answers[index].id ==
                                        item.userAnswer.answer
                                    ? ColorManager.red
                                    : ColorManager.white,
                          ),
                        ),
                        child: Stack(
                          children: [
                            item.answers[index].title.isNotEmpty
                                ? Center(
                                    child: Text(
                                      item.answers[index].title,
                                      textAlign: TextAlign.center,
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
                            if (item.answers[index].id ==
                                item.userAnswer.answer)
                              PositionedDirectional(
                                top: 7,
                                end: 7,
                                child: Container(
                                  padding: EdgeInsets.all(4.r),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.r)),
                                    color: item.answers[index].id ==
                                            item.multipleCorrectAnswer.id
                                        ? (UserService.to.isKsa.value
                                                ? Colors.green[400]
                                                : ColorManager.green)!
                                            .withOpacity(.5)
                                        : item.answers[index].id ==
                                                item.userAnswer.answer
                                            ? ColorManager.red.withOpacity(.5)
                                            : Colors.transparent,
                                  ),
                                  child: Text(
                                    'Your answer'.tr,
                                    style: TextStyle(
                                        color: item.answers[index].id ==
                                                item.multipleCorrectAnswer.id
                                            ? UserService.to.isKsa.value
                                                ? Colors.green[400]
                                                : ColorManager.green
                                            : item.answers[index].id ==
                                                    item.userAnswer.answer
                                                ? ColorManager.red
                                                : ColorManager.white,
                                        fontSize: 7.sp),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
