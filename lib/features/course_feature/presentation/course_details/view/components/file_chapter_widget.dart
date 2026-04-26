import 'package:hdtc_on/core/services/user_service.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/utils/toast_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../../core/routes/app_pages.dart';
import '../../../../domain/entities/content.dart';
import '../../controller/courses_details_controller.dart';

class FileChapterWidget extends StatelessWidget {
  const FileChapterWidget({
    super.key,
    required this.contents,
  });

  final List<Content> contents;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: contents.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              child: Text(
                contents[index].title,
                style: TextStyle(
                    fontSize: 13.sp,
                    color: ColorManager.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            FileChapterCard(
              content: contents[index],
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => 18.verticalSpace,
    );
  }
}

class FileChapterCard extends StatelessWidget {
  const FileChapterCard({
    super.key,
    required this.content,
  });

  final Content content;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesDetailsController>(
      builder: (controller) {
        return SizedBox(
          height: 70.h,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16).r,
            scrollDirection: Axis.horizontal,
            itemCount: content.items.length,
            itemBuilder: (context, index) {
              Item item = content.items[index];
              return InkWell(
                borderRadius: BorderRadius.circular(10.r),
                onTap: () async {
                  if (!content.isOpen) {
                    if (!controller.course!.authHasBought && !item.can!.view) {
                      ToastManager.showError(item.canViewError ?? '');
                      return;
                    }
                  }

                  if (UserService.to.currentUser.value == null) {
                    ToastManager.showError(item.canViewError ?? '');
                    return;
                  }

                  if (!controller.isPause) {
                    controller.isPause = true;
                    controller.update();
                  }

                  if (item.type == 'file') {
                    Get.toNamed(
                      Routes.contentFileDetails,
                      arguments: {
                        'file': [
                          ...controller.course!.sessionChapters!,
                          ...controller.course!.filesChapters!,
                        ]
                            .where((element) => element.title == content.title)
                            .first
                            .files
                            .where((element) => element.title == item.title)
                            .first,
                        'course': controller.course,
                        'item': item,
                        'content': content,
                      },
                    );
                  } else if (item.type == 'quiz') {
                    if (item.authHasResult) {
                      controller.getQuizResult(item.id.toString());
                    } else {
                      var quiz =
                          controller.course!.allQuizzes!.firstWhereOrNull(
                        (element) => element.id == content.items[index].id,
                      );

                      if (quiz == null) return;
                      Get.toNamed(Routes.quizParticipatedDetails, arguments: {
                        'quizParticipatedDetails': quiz,
                      })?.then((value) {
                        Get.log("file_chapter_widget==>${value.toString()}");
                        if (value != null) {
                          controller.initData();
                        }
                      });
                    }
                  }
                },
                child: Container(
                  width: 1.sw - 100.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.r,
                    vertical: 10.r,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
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
                                        ? (controller.course!.allQuizzes!
                                                    .firstWhereOrNull(
                                                      (element) =>
                                                          element.id ==
                                                          content
                                                              .items[index].id,
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
                                ? controller.course!.authHasBought
                                    ? Icons.play_circle
                                    : FontAwesomeIcons.download
                                : item.type == 'session'
                                    ? Icons.video_call
                                    : item.type == 'quiz'
                                        ? (controller.course!.allQuizzes!
                                                    .firstWhereOrNull(
                                                      (element) =>
                                                          element.id ==
                                                          content
                                                              .items[index].id,
                                                    )
                                                    ?.authCanStart ??
                                                false)
                                            ? Icons.more_horiz_rounded
                                            : Icons.done
                                        : Icons.list_alt,
                            size: 20.sp,
                            color: ColorManager.white,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
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
                              // Text(
                              //   item.type == 'file'
                              //       ? (item.volume ?? '')
                              //       : item.type == 'session'
                              //           ? DateFormat(
                              //                   'dd MMM yyyy | HH:mm:ss',
                              //                   Get.locale?.languageCode ??
                              //                       'EN')
                              //               .format(DateTime
                              //                   .fromMillisecondsSinceEpoch(
                              //                       (item.createdAt ?? 0) *
                              //                           1000))
                              //           : item.type == 'quiz'
                              //               ? '${item.questionCount} ${'Questions'.tr} | ${item.time == 0 ? 'Unlimited'.tr : '${item.time ?? 0} ${'Minutes'.tr}'}'
                              //               : DateFormat(
                              //                       'dd MMM yyyy',
                              //                       Get.locale?.languageCode ??
                              //                           'EN')
                              //                   .format(DateTime
                              //                       .fromMillisecondsSinceEpoch(
                              //                           (item.createdAt ?? 0) *
                              //                               1000)),
                              //   style: TextStyle(
                              //     fontSize: 10.sp,
                              //     color: ColorManager.grey5,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => 16.horizontalSpace,
          ),
        );
      },
    );
  }
}
