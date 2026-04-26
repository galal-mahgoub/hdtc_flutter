import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/routes/app_pages.dart';
import '../../../../../../core/theme/color_manager.dart';
import '../../../../domain/entities/category.dart';
import '../../../../domain/entities/sub_category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    this.isFirst = false,
    this.isLast = false,
  });

  final Category category;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: isFirst
            ? BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              )
            : isLast
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(10.r),
                    bottomRight: Radius.circular(10.r),
                  )
                : null,
        border: !isLast
            ? Border(
                bottom: BorderSide(
                  color: ColorManager.grey2,
                  width: 1.w,
                ),
              )
            : null,
        color: ColorManager.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8).r,
      child: ExpansionTile(
        backgroundColor: ColorManager.white,
        collapsedBackgroundColor: ColorManager.white,
        collapsedIconColor: category.subCategories.isNotEmpty
            ? ColorManager.grey4
            : ColorManager.white,
        iconColor: category.subCategories.isNotEmpty
            ? ColorManager.grey4
            : ColorManager.white,
        tilePadding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
            side: BorderSide.none // Adjust the border radius
            ),
        collapsedShape: const RoundedRectangleBorder(
            side: BorderSide.none // Adjust the border radius
            ),
        title: BrowseCategoriesItemTitleWidget(
          category: category,
        ),
        children: List.generate(
          category.subCategories.length,
          (index) {
            bool isLastItem = index == category.subCategories.length - 1;
            return BrowseCategoriesItemSubTitleWidget(
              subCategory: category.subCategories[index],
              isLast: isLastItem,
            );
          },
        ),
      ),
    );
  }
}

class BrowseCategoriesItemTitleWidget extends StatelessWidget {
  const BrowseCategoriesItemTitleWidget({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: category.subCategories.isEmpty
          ? () {
              Get.toNamed(
                Routes.categoryDetails,
                arguments: {
                  'id': category.id.toString(),
                  'title': category.title,
                },
              );
            }
          : null,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Row(
        children: [
          Container(
            height: 35.h,
            width: 35.w,
            padding: EdgeInsets.all(7.r),
            decoration: const BoxDecoration(
              color: ColorManager.white12,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CustomImage(
                path: category.icon.isNotEmpty ? category.icon : null,
                color: ColorManager.black,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.title.toString(),
                style: TextStyle(
                    fontSize: 13.sp,
                    color: ColorManager.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                '${category.webinarsCount.toString()} ${'Course'.tr}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorManager.grey4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BrowseCategoriesItemSubTitleWidget extends StatelessWidget {
  const BrowseCategoriesItemSubTitleWidget({
    Key? key,
    required this.subCategory,
    required this.isLast,
  }) : super(key: key);

  final SubCategory subCategory;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.categoryDetails,
        arguments: {
          'id': subCategory.id.toString(),
          'title': subCategory.title,
        },
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: VerticalDivider(
                      color: ColorManager.grey1,
                      thickness: 1.0,
                    ),
                  ),
                  Icon(
                    Icons.circle_outlined,
                    size: 15.sp,
                    color: ColorManager.grey1,
                  ),
                  Expanded(
                    child: VerticalDivider(
                      color: isLast ? ColorManager.white : ColorManager.grey1,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 15.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subCategory.title.toString(),
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: ColorManager.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      '${subCategory.webinarsCount.toString()} ${'Course'.tr}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: ColorManager.grey4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
