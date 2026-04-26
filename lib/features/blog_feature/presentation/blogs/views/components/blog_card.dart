import 'package:flutter_html/flutter_html.dart';
import 'package:hdtc_on/core/routes/app_pages.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:hdtc_on/features/blog_feature/domain/entities/blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
    required this.blog,
  });

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.blogDetails,
        arguments: blog,
      ),
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 160.h,
                  width: 1.sw,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: CustomImage(
                      path: blog.image.isNotEmpty ? blog.image : null,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                PositionedDirectional(
                  bottom: 10,
                  start: 10,
                  end: 10,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30.r,
                        width: 30.r,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(80.r)),
                          child: CustomImage(
                            path: blog.author.avatar.isNotEmpty
                                ? blog.author.avatar
                                : null,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: Text(
                          blog.author.fullName,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              blog.title,
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: ColorManager.black,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              height: 2 * (12.sp + 5.h),
              // Height for three lines of text
              child: Html(
                data: blog.description,
                style: {
                  // Add any custom styles here
                  "body": Style(
                    fontSize: FontSize(12.sp),
                    color: ColorManager.grey5,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                },
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: ColorManager.grey1,
                      size: 17.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      DateFormat(
                              'dd MMM yyyy', Get.locale?.languageCode ?? 'en')
                          .format(blog.createdAt),
                      style: TextStyle(
                        color: ColorManager.grey1,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.w,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 9.r,
                      backgroundColor: ColorManager.grey1,
                      child: Icon(
                        Icons.more_horiz,
                        color: ColorManager.white,
                        size: 11.sp,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      blog.commentCount.toString(),
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: ColorManager.grey1,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
