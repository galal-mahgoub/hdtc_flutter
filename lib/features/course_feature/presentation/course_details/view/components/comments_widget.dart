import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

import '../../../../../../core/widgets/empty_widget.dart';
import '../../../../../blog_feature/domain/entities/comment.dart';
import '../../controller/courses_details_controller.dart';
import 'comment_option_bottom_sheet_widget.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesDetailsController>(
      builder: (controller) {
        return controller.course!.comments != null &&
                controller.course!.comments!.isNotEmpty
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                shrinkWrap: true,
                itemCount: controller.course!.comments!.length,
                itemBuilder: (context, index) {
                  return CommentCard(
                    comment: controller.course!.comments![index],
                  );
                })
            : Center(
                child: EmptyWidget(
                  message: "NoComments".tr,
                ),
              );
      },
    );
  }
}

class CommentCard extends GetView<CoursesDetailsController> {
  const CommentCard({
    super.key,
    required this.comment,
  });

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 40.r,
                width: 40.r,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(80.r)),
                  child: CustomImage(
                    path: comment.user.avatar.isNotEmpty
                        ? comment.user.avatar
                        : null,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comment.user.fullName,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: ColorManager.black,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            comment.user.roleName,
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: ColorManager.grey5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (controller.course!.authHasBought)
                      InkWell(
                        onTap: () {
                          Get.bottomSheet(
                            CommentOptionBottomSheetCustom(
                              id: comment.id.toString(),
                            ),
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                          );
                        },
                        child: Icon(
                          Icons.more_horiz,
                          color: ColorManager.grey5,
                          size: 25.sp,
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            comment.comment,
            style: TextStyle(
              fontSize: 12.sp,
              color: ColorManager.grey5,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            DateFormat('dd MMM yyyy', Get.locale?.languageCode ?? 'EN')
                .format(comment.createdAt),
            style: TextStyle(
              fontSize: 10.sp,
              color: ColorManager.grey5,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: comment.replies.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5.r),
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.r)),
                    border: Border.all(
                      color: ColorManager.grey2,
                      // Set the color of the border
                      width: 1.0, // Set the width of the border
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 40.r,
                            width: 40.r,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80.r)),
                              child: CustomImage(
                                path: comment
                                        .replies[index].user.avatar.isNotEmpty
                                    ? comment.replies[index].user.avatar
                                    : null,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        comment.replies[index].user.fullName,
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: ColorManager.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        comment.replies[index].user.roleName,
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          color: ColorManager.grey5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.bottomSheet(
                                      CommentOptionBottomSheetCustom(
                                        id: comment.replies[index].id
                                            .toString(),
                                      ),
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                    );
                                  },
                                  child: Icon(
                                    Icons.more_horiz,
                                    color: ColorManager.grey5,
                                    size: 25.sp,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        comment.replies[index].comment,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: ColorManager.grey5,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        DateFormat(
                                'dd MMM yyyy', Get.locale?.languageCode ?? 'EN')
                            .format(DateTime.fromMillisecondsSinceEpoch(
                                comment.replies[index].createdAt * 1000)),
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: ColorManager.grey5,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
