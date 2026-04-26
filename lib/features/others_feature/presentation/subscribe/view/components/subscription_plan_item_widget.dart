import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/widgets/button_widget.dart';
import '../../../../domain/entities/subscribe.dart';
import '../../../../domain/entities/subscribe_respone.dart';
import '../../controllers/subscribes_controller.dart';

class SubscriptionPlanItemWidget extends StatelessWidget {
  const SubscriptionPlanItemWidget({
    super.key,
    required this.item,
    required this.subscribe,
    this.onPressed,
    this.isLoading = false,
  });

  final Subscription item;
  final SubscriptionRespone subscribe;
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscribesController>(
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: CustomImage(
                path: item.image.isNotEmpty ? item.image : null,
                fit: BoxFit.fill,
                height: 80.r,
                width: 80.r,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              item.title,
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 22.sp,
                color: ColorManager.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              item.description ?? '',
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 11.sp,
                color: ColorManager.grey5,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              item.subscribePriceString,
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 18.sp,
                color: ColorManager.green4,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '${item.days} ${'DaysSubscription'.tr}',
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 11.sp,
                color: ColorManager.grey5,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '${item.usableCount == '0' ? 'Unlimited'.tr : item.usableCount} ${'CoursesSubscription'.tr}',
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 11.sp,
                color: ColorManager.grey5,
              ),
            ),
            if (subscribe.subscribeId == item.id)
              Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    subscribe.remainedDownloads == 0
                        ? 'UnlimitedRemainedDownloads'.tr
                        : '${subscribe.remainedDownloads} ${'DaysUse'.tr}',
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 11.sp,
                      color: ColorManager.grey5,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '${'SubscriptionsEnds'.tr}  ${DateFormat('dd MM yyyy', Get.locale?.languageCode ?? 'EN').format(DateTime.now().add(Duration(days: subscribe.daysRemained ?? 0)))}',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 11.sp,
                      color: ColorManager.grey5,
                    ),
                  ),
                ],
              ),
            if (subscribe.scheduleSubscribeId == item.id)
              Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'ActivePackage'.tr,
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 11.sp,
                      color: context.theme.primaryColor,
                    ),
                  ),
                ],
              ),
            SizedBox(
              height: 15.h,
            ),
            ButtonWidget(
              isLoading: isLoading,
              text: Text(
                subscribe.subscribeId != 0
                    ? subscribe.subscribeId == item.id
                        ? 'ActivePlan'.tr
                        : subscribe.subscribePrice > item.price
                            ? 'Downgrade'.tr
                            : subscribe.subscribePrice != 0 &&
                                    subscribe.subscribePrice < item.price
                                ? 'Upgrade'.tr
                                : 'Purchase'.tr
                    : 'Purchase'.tr,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ColorManager.white,
                ),
              ),
              width: 1.sw,
              onPressed: onPressed,
              colorBtn: context.theme.primaryColor,
              radius: 15,
              paddingHorizontal: 15,
              paddingVertical: 10,
              marginHorizontal: 15,
              marginVertical: 0,
            ),
          ],
        );
      },
    );
  }
}
