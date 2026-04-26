import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'button_widget.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    this.message,
    this.nameBtn,
    this.onPressed,
    this.bgColor,
  });

  final String? message;
  final Widget? nameBtn;
  final VoidCallback? onPressed;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      width: 1.sw,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message ?? 'DataNotFound'.tr,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: ColorManager.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: nameBtn != null ? 10.h : 0,
            ),
            if (nameBtn != null)
              ButtonWidget(
                colorBtn: context.theme.primaryColor,
                text: nameBtn,
                onPressed: onPressed,
                width: 1.sw,
                paddingHorizontal: 10,
                paddingVertical: 10,
                marginHorizontal: 15,
                radius: 10,
              ),
          ],
        ),
      ),
    );
  }
}
