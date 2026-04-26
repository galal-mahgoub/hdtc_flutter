import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/empty_widget.dart';
import 'package:hdtc_on/features/blog_feature/domain/entities/blog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../controllers/blogs_controller.dart';
import 'components/blog_card.dart';
import 'components/blog_card_loading.dart';
import 'components/filter_blog_bottomsheet.dart';

class BlogsView extends StatelessWidget {
  const BlogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Blogs'.tr,
              style: TextManager.font16Text300W600,
            ),
            actions: [
              InkWell(
                onTap: () => Get.bottomSheet(
                  const FilterBlogBottomsheet(),
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(13.r),
                ),
                child: Container(
                  height: 40.r,
                  width: 40.r,
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.all(Radius.circular(13.r)),
                  ),
                  child: Icon(
                    Icons.tune,
                    size: 20.sp,
                    color: ColorManager.black,
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
            ],
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: controller.isLoading
              ? const BlogCardLoading(
                  count: 10,
                )
              : controller.blogs.isEmpty
                  ? EmptyWidget(
                      message: 'NoBlogs'.tr,
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(16).r,
                      itemCount: controller.blogs.length,
                      itemBuilder: (context, index) {
                        Blog blog = controller.blogs[index];
                        return BlogCard(
                          blog: blog,
                        );
                      },
                      separatorBuilder: (context, index) => 16.verticalSpace,
                    ),
        );
      },
    );
  }
}
