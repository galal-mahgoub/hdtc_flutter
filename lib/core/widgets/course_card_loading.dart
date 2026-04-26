import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/color_manager.dart';

class CourseCardLoading extends StatelessWidget {
  const CourseCardLoading({
    super.key,
    this.count = 0,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: SizedBox(
        height: 180.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: count,
          itemBuilder: (context, index) => Row(
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(start: 24.r),
                height: 180.h,
                width: 150.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(33.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 115.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: ColorManager.grey1,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 20.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: ColorManager.grey1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
