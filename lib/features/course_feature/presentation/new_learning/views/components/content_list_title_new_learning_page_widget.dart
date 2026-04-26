import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContentListTitleNewLearningPageWidget extends StatelessWidget {
  const ContentListTitleNewLearningPageWidget({
    super.key,
    required this.title,
    required this.numLessons,
  });

  final String title;
  final int numLessons;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: context.theme.primaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(13.r),
          ),
          child: Icon(
            Icons.grid_view_rounded,
            size: 35.sp,
            color: ColorManager.white,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 13.sp,
                    color: ColorManager.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                '$numLessons ${'lessons'.tr}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorManager.grey4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
