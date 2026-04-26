import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../services/user_service.dart';
import '../theme/color_manager.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.colorBtn,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.paddingHorizontal,
    required this.paddingVertical,
    this.radius = 10,
    this.marginHorizontal = 0,
    this.marginVertical = 0,
    this.colorBorder,
    this.colorBackground,
    this.isLoading = false,
  });

  final double width;
  final int paddingHorizontal;
  final int paddingVertical;
  final int marginHorizontal;
  final int marginVertical;
  final int radius;
  final Color? colorBtn;
  final Color? colorBorder;
  final Color? colorBackground;
  final Widget? text;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.symmetric(
          horizontal: marginHorizontal.r, vertical: marginVertical.r),
      decoration: colorBorder != null
          ? BoxDecoration(
              color: colorBackground,
              border: Border.all(
                color: colorBorder!,
              ),
              borderRadius: BorderRadius.circular(radius.r),
            )
          : null,
      // decoration: onPressed != null
      //     ? BoxDecoration(
      //         boxShadow: [
      //           BoxShadow(
      //               color: color!.withOpacity(0.3),
      //               blurRadius: 40,
      //               offset: const Offset(0, 15)),
      //           BoxShadow(
      //               color: color!.withOpacity(0.2),
      //               blurRadius: 13,
      //               offset: const Offset(0, 3))
      //         ],
      //         // borderRadius: BorderRadius.all(Radius.circular(20)),
      //       )
      //     : null,
      child: MaterialButton(
        onPressed: isLoading ? () {} : onPressed,
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal.r, vertical: paddingVertical.r),
        color: colorBtn,
        highlightElevation: 0,
        disabledElevation: 0,
        disabledColor: Get.theme.focusColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.r)),
        elevation: 0,
        child: isLoading
            ? SizedBox(
                height: 16.h,
                width: 50.w,
                child: Center(
                  child: LinearProgressIndicator(
                    color: colorBtn ??
                        (UserService.to.isKsa.value
                            ? Colors.green[400]
                            : ColorManager.green),
                  ),
                ),
              )
            : text,
      ),
    );
  }
}
