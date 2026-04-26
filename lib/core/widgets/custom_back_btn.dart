import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../theme/color_manager.dart';

class CustomBackBtn extends StatelessWidget {
  const CustomBackBtn({
    Key? key,
    this.onPressed,
    this.backgroundColor,
  }) : super(key: key);

  final Color? backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed ?? () => Get.back(),
        borderRadius: BorderRadius.all(
          Radius.circular(13.r),
        ),
        child: Container(
          height: 40.r,
          width: 40.r,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.all(Radius.circular(13.r)),
          ),
          child: Icon(
            Icons.arrow_back,
            size: 20.sp,
            color: ColorManager.black,
          ),
        ),
      ),
    );
  }
}
