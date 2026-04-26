import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/routes/app_pages.dart';
import '../../../../domain/entities/category.dart';

class TrendCategoryCard extends StatelessWidget {
  const TrendCategoryCard({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.categoryDetails,
          arguments: {
            'id': category.id.toString(),
            'title': category.title,
          },
        );
      },
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: 1.sw - 100.w,
        padding: EdgeInsets.symmetric(
          horizontal: 8.r,
          vertical: 10.r,
        ),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                height: 50.r,
                width: 50.r,
                padding: EdgeInsets.all(13.r),
                decoration: BoxDecoration(
                  color: Color(
                    int.parse(
                      category.color!.replaceAll("#", "0xFF"),
                    ),
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(13.r),
                ),
                child: CustomImage(
                  path: category.icon.isNotEmpty ? category.icon : null,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.title.toString(),
                    maxLines: 1,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
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
        ),
      ),
    );
  }
}
