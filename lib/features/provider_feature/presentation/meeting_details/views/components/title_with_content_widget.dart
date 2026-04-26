import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitlteWithContentWidget extends StatelessWidget {
  const TitlteWithContentWidget({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        border: Border.all(
          width: 1,
          color: ColorManager.grey,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: ColorManager.black,
            ),
          ),
          SizedBox(
            height: 10.r,
          ),
          Text(
            content,
            style: TextStyle(
              fontSize: 11.sp,
              color: ColorManager.grey,
            ),
          ),
        ],
      ),
    );
  }
}
