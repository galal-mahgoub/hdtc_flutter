import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/user_service.dart';
import '../theme/color_manager.dart';
import '../theme/text_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.height,
    required this.onPressed,
    this.text,
    this.elevation,
    this.width,
    this.color,
    this.borderColor,
    this.textColor,
    this.child,
    this.padding,
    this.isLoading = false,
    Key? key,
    this.borderRadius,
    this.foregroundColor,
    this.shadowColor,
    this.surfaceTintColor,
    this.noHeight = false,
  }) : super(key: key);
  final void Function()? onPressed;
  final double? height;
  final double? borderRadius;
  final double? width;
  final Color? color;
  final Color? borderColor;
  final double? elevation;
  final String? text;
  final Color? textColor;
  final bool isLoading;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  final bool noHeight;
  final Color? foregroundColor;
  final Color? shadowColor;
  final Color? surfaceTintColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: noHeight ? null : height ?? 56.r,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          foregroundColor: foregroundColor,
          shadowColor: shadowColor,
          surfaceTintColor: surfaceTintColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10.r),
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: 1.w)
                : BorderSide.none,
          ),
          backgroundColor: color ??
              (UserService.to.isKsa.value
                  ? Colors.green[400]
                  : ColorManager.green),
          elevation: elevation ?? 0,
        ),
        onPressed: isLoading ? () {} : onPressed,
        child: isLoading
            ? SizedBox(
                width: 40.w,
                child: const LinearProgressIndicator(
                  backgroundColor: ColorManager.whiteColor,
                  color: ColorManager.primary300Color,
                ),
              )
            : child ??
                Text(
                  text ?? '',
                  style: TextManager.font16WhiteW600.copyWith(color: textColor),
                ),
      ),
    );
  }
}
