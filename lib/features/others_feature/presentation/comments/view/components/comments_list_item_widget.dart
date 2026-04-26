import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/routes/app_pages.dart';
import '../../../../../blog_feature/domain/entities/comment.dart';
import '../../controllers/comments_controller.dart';

class CommentsListItemWidget extends StatelessWidget {
  const CommentsListItemWidget({
    super.key,
    required this.item,
    required this.type,
  });

  final Comment item;
  final String type;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentsController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () async {
            await Get.toNamed(Routes.commentsDetails,
                    arguments: {'item': item, 'type': type})
                ?.then((value) => controller.getComments());
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              color: ColorManager.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: type == 'comment' ? 65.h : 52.h,
                  width: type == 'comment' ? 110.w : 55.w,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(type == 'comment' ? 10.r : 15.r),
                    child: CustomImage(
                      path: type == 'comment'
                          ? item.course?.image != null &&
                                  item.course!.image.isNotEmpty
                              ? item.course!.image
                              : item.blog!.image.isNotEmpty
                                  ? item.blog!.image
                                  : null
                          : item.user.avatar.isNotEmpty
                              ? item.user.avatar
                              : null,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        type == 'comment'
                            ? item.course?.title != null &&
                                    item.course!.title.isNotEmpty
                                ? item.course!.title
                                : item.blog?.title != null &&
                                        item.blog!.title.isNotEmpty
                                    ? item.blog!.title
                                    : ''
                            : item.user.fullName,
                        maxLines: 2,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      ),
                      SizedBox(
                        height: type == 'comment' ? 5.h : 2.h,
                      ),
                      type == 'classComment'
                          ? Column(
                              children: [
                                Text(
                                  item.course?.title != null &&
                                          item.course!.title.isNotEmpty
                                      ? item.course!.title
                                      : item.blog?.title != null &&
                                              item.blog!.title.isNotEmpty
                                          ? item.blog!.title
                                          : '',
                                  maxLines: 2,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 9.sp,
                                    color: ColorManager.grey5,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                              ],
                            )
                          : Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: ColorManager.grey4,
                            size: 15.sp,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Expanded(
                            child: Text(
                              DateFormat(
                                      type == 'comment'
                                          ? 'dd MMM yyyy | HH:mm:ss'
                                          : 'dd MMM yyyy',
                                      GetStorage()
                                              .read<String>('language_code') ??
                                          'EN')
                                  .format(item.createdAt),
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 8.sp,
                                color: ColorManager.grey1,
                              ),
                            ),
                          ),
                        ],
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
