import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/theme/text_manager.dart';
import 'package:hdtc_on/features/category_feature/presentation/categories/view/components/trend_category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../domain/entities/category.dart';
import '../../controller/categories_controller.dart';

class TrendCategoriesListWidget extends StatelessWidget {
  const TrendCategoriesListWidget({super.key});

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
                  'trend'.tr,
                  style: TextManager.font16Text300W500,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 70.h,
                child: controller.isTrendLoading
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        enabled: true,
                        child: SizedBox(
                          height: 70.h,
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(horizontal: 16.r),
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 1.sw - 100.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: ColorManager.white11,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                16.horizontalSpace,
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.r),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.trendCategories.length,
                        itemBuilder: (context, index) {
                          Category category = controller.trendCategories[index];
                          return TrendCategoryCard(
                            category: category,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            16.horizontalSpace,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
