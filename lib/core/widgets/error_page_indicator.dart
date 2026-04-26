import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorPageIndicator extends StatelessWidget {
  const ErrorPageIndicator({
    super.key,
    required this.message,
    required this.press,
  });

  final String message;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: TextStyle(color: ColorManager.black, fontSize: 20.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: 130.w,
              child: IconButton(
                onPressed: press,
                icon: Icon(
                  Icons.refresh,
                  size: 35.sp,
                  color: ColorManager.green4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
