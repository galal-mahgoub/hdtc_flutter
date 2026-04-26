import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWithIconWidget extends StatelessWidget {
  const ButtonWithIconWidget({
    Key? key,
    required this.colorBorder,
    required this.nameText,
    required this.onPressed,
    required this.width,
    required this.paddingHorizontal,
    required this.paddingVertical,
    required this.icon,
    this.radius = 10,
    this.marginHorizontal = 0,
    this.marginVertical = 0,
    required this.colorBackground,
    required this.colorText,
  }) : super(key: key);

  final double width;
  final int paddingHorizontal;
  final int paddingVertical;
  final int marginHorizontal;
  final int marginVertical;
  final int radius;
  final Color colorBorder;
  final Color colorBackground;
  final Color colorText;
  final String nameText;
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(radius.r),
      child: Container(
        width: width,
        margin: EdgeInsets.symmetric(
            horizontal: marginHorizontal.r, vertical: marginVertical.r),
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal.r, vertical: paddingVertical.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius.r),
          border: Border.all(color: colorBorder, width: 1.w),
          color: colorBackground,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20.sp,
              color: colorText,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              nameText,
              style: TextStyle(
                fontSize: 15.sp,
                color: colorText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
