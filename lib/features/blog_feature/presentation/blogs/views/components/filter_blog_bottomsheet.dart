import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/features/blog_feature/domain/entities/blog_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';
import '../../controllers/blogs_controller.dart';

class FilterBlogBottomsheet extends StatelessWidget {
  const FilterBlogBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlogsController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(top: 15.r),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(end: 10.r),
                        padding: EdgeInsets.all(15.r),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.all(Radius.circular(13.r)),
                        ),
                        child: Icon(
                          Icons.close,
                          size: 22.sp,
                          color: ColorManager.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 1.sw,
                  padding: EdgeInsets.symmetric(
                    vertical: 24.r,
                    horizontal: 24.r,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(13.r),
                      topRight: Radius.circular(13.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BlogCategories'.tr,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.black,
                        ),
                      ),
                      8.verticalSpace,
                      controller.isFilterLoading
                          ? Center(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: context.theme.primaryColor,
                                ),
                              ),
                            )
                          : controller.blogsCategories.isEmpty
                              ? const SizedBox()
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.blogsCategories.length,
                                  itemBuilder: ((_, index) {
                                    BlogCategory blogCategory =
                                        controller.blogsCategories[index];
                                    return FilterCategoryCard(
                                      selectedBlogCategory:
                                          controller.selectedBlogCategory,
                                      blogCategory: blogCategory,
                                      onChanged: (value) =>
                                          controller.selectCategoryFilter(
                                        blogCategory,
                                      ),
                                    );
                                  }),
                                )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class FilterCategoryCard extends StatelessWidget {
  const FilterCategoryCard({
    super.key,
    required this.blogCategory,
    required this.selectedBlogCategory,
    required this.onChanged,
  });

  final BlogCategory blogCategory;
  final BlogCategory selectedBlogCategory;
  final void Function(BlogCategory?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<BlogCategory>(
      contentPadding: EdgeInsets.zero,
      value: blogCategory,
      groupValue: selectedBlogCategory,
      onChanged: onChanged,
      activeColor: context.theme.primaryColor,
      title: Text(
        blogCategory.title,
        style: TextStyle(
          fontSize: 15.sp,
          color: selectedBlogCategory.id == blogCategory.id
              ? UserService.to.isKsa.value
                  ? Colors.green[400]
                  : ColorManager.green
              : ColorManager.black,
        ),
      ),
    );
  }
}
