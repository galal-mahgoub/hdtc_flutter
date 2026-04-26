/*
 * Copyright (c) 2023 .
 */

import 'package:hdtc_on/core/routes/app_pages.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:hdtc_on/core/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../domain/entities/provider.dart';

class ProviderCard extends StatelessWidget {
  const ProviderCard({
    super.key,
    required this.provider,
  });

  final Provider provider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.instructorDetails, arguments: provider),
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
      child: Container(
        height: 180.h,
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 70.r,
              width: 70.r,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(55.r),
                child: CustomImage(
                  path: provider.avatar.isNotEmpty ? provider.avatar : null,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              provider.fullName,
              maxLines: 2,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 12.sp,
                color: ColorManager.black,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              provider.roleName == 'teacher'
                  ? 'Instructor'.tr
                  : provider.roleName == 'consultant'
                      ? 'Consultant'.tr
                      : '',
              maxLines: 2,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 11.sp,
                color: ColorManager.grey4,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomRatingBar(value: provider.rate),
          ],
        ),
      ),
    );
  }
}
