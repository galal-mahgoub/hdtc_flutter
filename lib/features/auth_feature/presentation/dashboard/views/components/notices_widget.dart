import 'package:hdtc_on/core/services/user_service.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'notices_item_widget.dart';

class NoticesWidget extends GetView<UserService> {
  const NoticesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (controller.quickInfo.value != null &&
              controller.quickInfo.value!.unreadNoticeboards!.isNotEmpty)
            ExpandablePageView.builder(
              onPageChanged: (index) =>
                  controller.currentIndexSliderNoticeDashBoard.value = index,
              scrollDirection: Axis.horizontal,
              itemCount:
                  controller.quickInfo.value?.unreadNoticeboards?.length ?? 0,
              itemBuilder: (BuildContext context, index) =>
                  (controller.quickInfo.value!.unreadNoticeboards ?? []).isEmpty
                      ? const SizedBox()
                      : NoticesItemWidget(
                          item: controller
                              .quickInfo.value!.unreadNoticeboards![index],
                        ),
            ),
          SizedBox(
            height: 10.h,
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.quickInfo.value!.unreadNoticeboards?.length ?? 0,
                (position) => Padding(
                  padding: EdgeInsets.only(right: 8.r),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: position ==
                            controller.currentIndexSliderNoticeDashBoard.value
                        ? 21.w
                        : 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      borderRadius:
                          controller.currentIndexSliderNoticeDashBoard.value ==
                                  position
                              ? BorderRadius.circular(7.r)
                              : BorderRadius.circular(16.r),
                      color:
                          controller.currentIndexSliderNoticeDashBoard.value ==
                                  position
                              ?context.theme.primaryColor
                              : ColorManager.grey1,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
