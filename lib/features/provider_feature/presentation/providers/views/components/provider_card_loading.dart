import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProviderCardLoading extends StatelessWidget {
  const ProviderCardLoading({
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
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 170.h,
        ),
        itemCount: count,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Column(
            children: [
              Container(
                height: 100.h,
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
                height: 13.h,
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: ColorManager.grey1,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 13.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: ColorManager.grey1,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: Container(
                            height: 13.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: ColorManager.grey1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Container(
                    height: 13.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: ColorManager.grey1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 13.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: ColorManager.grey1,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    height: 13.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: ColorManager.grey1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        shrinkWrap: true,
      ),
    );
  }
}
