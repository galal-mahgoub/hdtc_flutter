import 'package:flutter_html/flutter_html.dart';
import 'package:hdtc_on/core/routes/app_pages.dart';
import 'package:hdtc_on/core/services/user_service.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../../../domain/entities/comment.dart';
import '../controllers/blog_details_controller.dart';
import 'components/add_comment_blog_bottomsheet.dart';
import 'components/blog_comment_card.dart';

class BlogDetailsView extends StatelessWidget {
  const BlogDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogDetailsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'BlogPost'.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16).r,
            children: [
              Text(
                controller.blog!.title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.black,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
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
                    DateFormat('dd MMM yyyy', Get.locale?.languageCode ?? 'en')
                        .format(controller.blog!.createdAt),
                    style: TextStyle(
                      color: ColorManager.grey1,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 190.h,
                width: 1.sw,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CustomImage(
                    path: controller.blog!.image.isNotEmpty
                        ? controller.blog!.image
                        : null,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 30.r,
                    width: 30.r,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(80.r)),
                      child: CustomImage(
                        path: controller.blog!.author.avatar.isNotEmpty
                            ? controller.blog!.author.avatar
                            : null,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.blog!.author.fullName,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.black,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          controller.blog!.author.roleName,
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
              SizedBox(
                height: 16.h,
              ),
              Html(
                data: controller.blog!.content ?? '',
                style: {
                  // Add any custom styles here
                  "body": Style(
                    fontSize: FontSize(12.sp),
                    color: ColorManager.grey4,
                  ),
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              if (controller.blog!.comments.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comments'.tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.black,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.blog!.comments.length,
                      itemBuilder: (context, index) {
                        Comment comment = controller.blog!.comments[index];
                        return BlogCommentCard(
                          comment: comment,
                        );
                      },
                    ),
                  ],
                ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
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
              text: Text(
                'LeaveComment'.tr,
                style: TextStyle(fontSize: 15.sp, color: ColorManager.white),
              ),
              onPressed: () {
                if (UserService.to.currentUser.value == null) {
                  Get.toNamed(Routes.login);
                } else {
                  Get.bottomSheet(
                    const AddCommentBlogBottomsheet(),
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                  );
                }
              },
              width: 1.sw,
              paddingHorizontal: 10,
              paddingVertical: 10,
              radius: 10,
            ),
          ),
        );
      },
    );
  }
}
