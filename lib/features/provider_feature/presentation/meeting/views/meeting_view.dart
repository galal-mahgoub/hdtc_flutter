import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_back_btn.dart';
import 'package:hdtc_on/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/services/user_service.dart';
import '../../../../../core/theme/text_manager.dart';
import '../controllers/meeting_controller.dart';
import 'components/reserved_list_widget.dart';

class MeetingView extends StatelessWidget {
  const MeetingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MeetingController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'BusinessConsultations'.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: CustomLoading(
            widget: controller.reservation == null
                ? const SizedBox()
                : ListView(
                    padding: EdgeInsets.all(16.r),
                    children: [
                      UserService.to.currentUser.value!.roleName == 'user'
                          ? const SizedBox()
                          : CustomSlidingSegmentedControl<int>(
                              customSegmentSettings: CustomSegmentSettings(
                                borderRadius: BorderRadius.circular(36.r),
                              ),
                              isStretch: true,
                              innerPadding: const EdgeInsets.all(8).r,
                              initialValue: controller.currentIndex,
                              children: {
                                0: Text(
                                  "Reserved".tr,
                                  style: controller.currentIndex == 0
                                      ? TextManager.font14WhiteW500
                                      : TextManager.font14Text75W400.copyWith(
                                          color:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                                        ),
                                ),
                                1: Text(
                                  "Requests".tr,
                                  style: controller.currentIndex == 1
                                      ? TextManager.font14WhiteW500
                                      : TextManager.font14Text75W400.copyWith(
                                          color:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                                        ),
                                ),
                              },
                              padding: 0,
                              decoration: BoxDecoration(
                                color:(UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green)!.withOpacity(.1),
                                borderRadius: BorderRadius.circular(36.r),
                              ),
                              thumbDecoration: BoxDecoration(
                                color:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                                borderRadius: BorderRadius.circular(28.r),
                              ),
                              curve: Curves.linear,
                              onValueChanged: (value) =>
                                  controller.changeViewIndex(value),
                            ),
                      16.verticalSpace,
                      ExpandablePageView(
                        controller: controller.pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          ReservedListWidget(
                            reserved: controller.reservation!.reservations,
                          ),
                          if (UserService.to.currentUser.value!.roleName !=
                              'user')
                            ReservedListWidget(
                              reserved: controller.reservation!.requests,
                            ),
                        ],
                      ),
                    ],
                  ),
            isLoading: controller.isLoading,
          ),
        );
      },
    );
  }
}
