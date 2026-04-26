import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NoMoreItems extends StatelessWidget {
  const NoMoreItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'upToDate'.tr,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: ColorManager.grey,
        fontSize: 16.sp,
      ),
    );
  }
}
