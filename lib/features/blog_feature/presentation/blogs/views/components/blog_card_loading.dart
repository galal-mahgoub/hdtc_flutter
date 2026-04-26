import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class BlogCardLoading extends StatelessWidget {
  const BlogCardLoading({
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
      child: ListView.separated(
        itemCount: 10,
        padding: const EdgeInsets.all(16).r,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 160.h,
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: ColorManager.white6,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 10.h,
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: ColorManager.white6,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 10.h,
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: ColorManager.white6,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => 16.verticalSpace,
      ),
    );
  }
}
