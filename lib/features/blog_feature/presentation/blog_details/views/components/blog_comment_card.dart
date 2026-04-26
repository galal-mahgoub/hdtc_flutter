import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/comment.dart';

class BlogCommentCard extends StatelessWidget {
  const BlogCommentCard({
    Key? key,
    required this.comment,
  }) : super(key: key);

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
                    // InkWell(
                    //   onTap: () {},
                    //   child: Icon(
                    //     Icons.more_horiz,
                    //     color: ColorManager.grey5,
                    //     size: 25.sp,
                    //   ),
                    // )
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
            DateFormat('dd MMM yyyy', Get.locale?.languageCode ?? 'en')
                .format(comment.createdAt),
            style: TextStyle(
              fontSize: 10.sp,
              color: ColorManager.grey5,
            ),
          ),
        ],
      ),
    );
  }
}
