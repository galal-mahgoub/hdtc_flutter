import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoDashboardWidget extends StatelessWidget {
  const InfoDashboardWidget({
    super.key,
    required this.backgroundIconColor,
    required this.icon,
    required this.value,
    required this.name,
  });

  final Color backgroundIconColor;
  final Widget icon;
  final String? value;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.r),
      padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 10.r),
      width: 130.w,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.all(Radius.circular(13.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: backgroundIconColor,
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            value ?? '',
            maxLines: 1,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            name,
            maxLines: 2,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 11.sp,
                color: ColorManager.grey1
                //
                ),
          ),
        ],
      ),
    );
  }
}
