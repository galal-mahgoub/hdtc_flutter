import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/services/user_service.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../controllers/subscribes_controller.dart';
import 'components/financial_summary_widget.dart';
import 'components/subscription_widget.dart';

class SubscribesView extends StatelessWidget {
  const SubscribesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscribesController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Subscription'.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: CustomLoading(
            widget: ListView(
              padding: EdgeInsets.all(16.r),
              children: [
                CustomSlidingSegmentedControl<int>(
                  customSegmentSettings: CustomSegmentSettings(
                    borderRadius: BorderRadius.circular(36.r),
                  ),
                  isStretch: true,
                  innerPadding: const EdgeInsets.all(8).r,
                  initialValue: controller.currentIndex,
                  children: {
                    0: Text(
                      "Subscription".tr,
                      style: controller.currentIndex == 0
                          ? TextManager.font14WhiteW500
                          : TextManager.font14Text75W400.copyWith(
                              color: UserService.to.isKsa.value
                                  ? Colors.green[400]
                                  : ColorManager.green,
                            ),
                    ),
                    1: Text(
                      "Summary".tr,
                      style: controller.currentIndex == 1
                          ? TextManager.font14WhiteW500
                          : TextManager.font14Text75W400.copyWith(
                              color: UserService.to.isKsa.value
                                  ? Colors.green[400]
                                  : ColorManager.green,
                            ),
                    ),
                  },
                  padding: 0,
                  decoration: BoxDecoration(
                    color: (UserService.to.isKsa.value
                            ? Colors.green[400]
                            : ColorManager.green)!
                        .withOpacity(.1),
                    borderRadius: BorderRadius.circular(36.r),
                  ),
                  thumbDecoration: BoxDecoration(
                    color: UserService.to.isKsa.value
                        ? Colors.green[400]
                        : ColorManager.green,
                    borderRadius: BorderRadius.circular(28.r),
                  ),
                  curve: Curves.linear,
                  onValueChanged: (value) => controller.changeViewIndex(value),
                ),
                16.verticalSpace,
                ExpandablePageView(
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    SubscriptionWidget(),
                    FinancialSummaryWidget(),
                  ],
                ),
                // TODO: add cancel subscription
                // if (UserService.to.currentUser.value?.activeSubscription ==
                //     null) ...[
                //   16.verticalSpace,
                //   ButtonWidget(
                //     isLoading: controller.isCancelSubscribeLoading,
                //     colorBtn: ColorManager.red,
                //     text: Text(
                //       LocaleKeys.cancelSubscription.tr,
                //       style:
                //           TextStyle(fontSize: 15.sp, color: ColorManager.white),
                //     ),
                //     onPressed: () => {},
                //     width: 1.sw,
                //     paddingHorizontal: 10,
                //     paddingVertical: 10,
                //     marginHorizontal: 15,
                //     radius: 15,
                //   )
                // ],
              ],
            ),
            isLoading: controller.isLoading,
          ),
        );
      },
    );
  }
}
