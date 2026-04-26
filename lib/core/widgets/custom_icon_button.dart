import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/color_manager.dart';
import 'custom_image.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.icon,
    this.size,
    this.onTap,
    this.bgColor,
    this.iconColor,
    this.iconSize,
    this.shape,
    this.borderRadius,
    this.child,
  });

  final String? icon;
  final double? size;
  final void Function()? onTap;
  final Color? bgColor;
  final Color? iconColor;
  final double? iconSize;
  final BoxShape? shape;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black12,
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Container(
        width: size ?? 32.r,
        height: size ?? 32.r,
        decoration: BoxDecoration(
          color: bgColor ?? ColorManager.scafoldBgColor,
          shape: borderRadius != null
              ? BoxShape.rectangle
              : shape ?? BoxShape.circle,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: child ??
              CustomImage(
                path: icon,
                width: iconSize ?? 16.r,
                height: iconSize ?? 16.r,
                color: iconColor,
              ),
        ),
      ),
    );
  }
}
