import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../consts/assets.dart';
import '../theme/color_manager.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
    required this.widget,
    required this.isLoading,
    this.bgColor,
    this.withLoading = true,
  });

  final Widget widget;
  final bool isLoading;
  final Color? bgColor;
  final bool withLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget,
        if (isLoading)
          Container(
            width: 1.sw,
            height: Get.height,
            color: bgColor ?? ColorManager.blackColor.withOpacity(.4),
            child: !withLoading
                ? const SizedBox()
                : Center(
                    child: LottieBuilder.asset(
                      Assets.loading,
                      width: 1.sw / 2,
                      fit: BoxFit.fill,
                    ),
                  ),
          ),
      ],
    );
  }
}
