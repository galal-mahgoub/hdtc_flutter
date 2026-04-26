import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/subscribes_controller.dart';
import 'subscription_plan_item_widget.dart';

class SubscriptionWidget extends StatelessWidget {
  const SubscriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscribesController>(
      builder: (controller) {
        return controller.subscriptionRespone == null
            ? const SizedBox()
            : ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.subscriptionRespone!.subscribes.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    width: 1.sw,
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      color: ColorManager.white,
                    ),
                    child: SubscriptionPlanItemWidget(
                      isLoading: controller.isCheckLoading ==
                          controller.subscriptionRespone!.subscribes[index].id
                              .toString(),
                      item: controller.subscriptionRespone!.subscribes[index],
                      subscribe: controller.subscriptionRespone!,
                      onPressed: controller.subscriptionRespone!.subscribeId ==
                                  controller.subscriptionRespone!
                                      .subscribes[index].id ||
                              controller.subscriptionRespone!
                                      .scheduleSubscribeId !=
                                  0
                          ? null
                          : () {
                              controller.checkoutSubscription(
                                controller
                                    .subscriptionRespone!.subscribes[index].id
                                    .toString(),
                              );
                            },
                    ),
                  );
                },
                separatorBuilder: (context, index) => 16.verticalSpace,
              );
      },
    );
  }
}
