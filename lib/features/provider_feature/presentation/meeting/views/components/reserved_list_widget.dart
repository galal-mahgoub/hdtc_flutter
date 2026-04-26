import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/features/auth_feature/presentation/mainlayout/controllers/mainlayout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/widgets/empty_widget.dart';
import '../../../../domain/entities/reservation.dart';
import '../../controllers/meeting_controller.dart';
import 'reserved_list_item_widget.dart';

class ReservedListWidget extends StatelessWidget {
  const ReservedListWidget({required this.reserved, super.key});

  final List<Meeting> reserved;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeetingController>(
      builder: (controller) {
        if (controller.isLoading) {
          return const ReservedListLoading();
        } else if (reserved.isEmpty) {
          return SizedBox(
            height: Get.height / 2,
            child: EmptyWidget(
              message: 'NoReservedConsultations'.tr,
              nameBtn: Text(
                'Consultants'.tr,
                style: TextStyle(fontSize: 15.sp, color: ColorManager.white),
              ),
              onPressed: () {
                Get.back();
                MainLayoutController.to.changeIndex(1, isShowConsultant: true);
              },
            ),
          );
        } else {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: reserved.length,
            itemBuilder: (context, index) {
              return ReservedListItemWidget(
                item: reserved[index],
              );
            },
            separatorBuilder: (context, index) => 16.verticalSpace,
          );
        }
      },
    );
  }
}

class ReservedListLoading extends StatelessWidget {
  const ReservedListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 70.h,
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: ColorManager.white6,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 10.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: ColorManager.white6,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          height: 10.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: ColorManager.white6,
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
                          height: 10.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: ColorManager.white6,
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Container(
                          height: 10.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            color: ColorManager.white6,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, index) => 16.verticalSpace,
      ),
    );
  }
}
