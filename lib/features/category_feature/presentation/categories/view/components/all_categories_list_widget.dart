import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/theme/text_manager.dart';
import '../../../../domain/entities/category.dart';
import '../../controller/categories_controller.dart';
import 'category_card.dart';

class AllCategoriesListWidget extends StatelessWidget {
  const AllCategoriesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Text(
                  'browseCategories'.tr,
                  style: TextManager.font16Text300W500,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              controller.isLoading
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.r),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 70.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: ColorManager.white11,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => 16.verticalSpace,
                      ),
                    )
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        Category category = controller.categories[index];
                        return CategoryCard(
                          category: category,
                          isFirst: index == 0,
                          isLast: controller.categories.last == category,
                        );
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
