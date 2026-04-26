import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/routes/app_pages.dart';
import '../../../../../../core/services/user_service.dart';
import '../../../../domain/entities/content.dart';
import '../../controllers/new_learning_page_controller.dart';

class ContentListSubTitleNewLearningPageWidget extends StatelessWidget {
  const ContentListSubTitleNewLearningPageWidget({
    super.key,
    required this.item,
    required this.title,
    required this.isLast,
    required this.authStatus,
  });

  final Item item;
  final String title;
  final bool isLast;
  final String authStatus;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewLearningPageController>(
      builder: (controller) {
        return InkWell(
          onTap: () async {
            if (item.type == 'file') {
              Get.toNamed(
                Routes.contentFileDetails,
                arguments: {
                  'file': [
                    ...controller.course.sessionChapters!,
                    ...controller.course.filesChapters!,
                  ]
                      .where((element) => element.title == title)
                      .first
                      .files
                      .where((element) => element.title == item.title)
                      .first,
                  'course': controller.course,
                  'item': item,
                },
              );
            } else if (item.type == 'quiz') {
              if (item.authHasResult) {
                controller.getQuizResult(item.id.toString());
              } else {
                var quiz = controller.course.allQuizzes!
                    .firstWhereOrNull((element) => element.id == item.id);

                if (quiz == null) return;
                Get.toNamed(Routes.quizParticipatedDetails, arguments: {
                  'quizParticipatedDetails': quiz,
                });
              }
            }
          },
          child: IntrinsicHeight(
            child: Row(
              children: [
                Column(
                  children: [
                    const Expanded(
                      child: VerticalDivider(
                        color: ColorManager.blue,
                        thickness: 1.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: item.type == 'file'
                            ? UserService.to.isKsa.value
                                ? Colors.green[400]
                                : ColorManager.green
                            : item.type == 'session'
                                ? ColorManager.blue6
                                : item.type == 'quiz'
                                    ? (controller.course.allQuizzes!
                                                .firstWhereOrNull(
                                                  (element) =>
                                                      element.id == item.id,
                                                )
                                                ?.authCanStart ??
                                            false)
                                        ? ColorManager.grey1
                                        : ColorManager.green5
                                    : ColorManager.blue1,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(13.r),
                      ),
                      child: Icon(
                        item.type == 'file'
                            ? Icons.play_circle
                            : item.type == 'session'
                                ? Icons.video_call
                                : item.type == 'quiz'
                                    ? (controller.course.allQuizzes!
                                                .firstWhereOrNull(
                                                  (element) =>
                                                      element.id == item.id,
                                                )
                                                ?.authCanStart ??
                                            false)
                                        ? Icons.more_horiz_rounded
                                        : Icons.done
                                    : Icons.list_alt,
                        size: 35.sp,
                        color: ColorManager.white,
                      ),
                    ),
                    Expanded(
                      child: VerticalDivider(
                        color: isLast ? ColorManager.white : ColorManager.blue,
                        thickness: 1.0,
                      ),
                    ),
                  ],
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
                        item.title ?? '',
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
                        (item.type == 'file'
                                ? item.volume
                                : item.type == 'session'
                                    ? DateFormat('dd MMM yyyy | HH:mm:ss',
                                            Get.locale?.languageCode ?? 'EN')
                                        .format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                (item.createdAt ?? 0) * 1000))
                                    : item.type == 'quiz'
                                        ? '${item.questionCount} ${'Questions'.tr} | ${item.time == 0 ? 'Unlimited'.tr : '${item.time ?? 0} ${'Minutes'.tr}'} '
                                        : DateFormat(
                                                'dd MMM yyyy',
                                                Get.locale?.languageCode ??
                                                    'EN')
                                            .format(DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    (item.createdAt ?? 0) *
                                                        1000))) ??
                            '',
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
    );
  }
}
