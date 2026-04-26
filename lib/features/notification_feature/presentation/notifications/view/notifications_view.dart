import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/widgets/custom_back_btn.dart';
import 'package:hdtc_on/core/widgets/empty_widget.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/widgets/error_page_indicator.dart';
import '../../../../../core/widgets/no_more_items.dart';
import '../controller/notifications_controller.dart';
import 'components/notification_card.dart';
import '../../../domain/entities/notification.dart' as n;

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.white13,
          appBar: AppBar(
            backgroundColor: ColorManager.white13,
            centerTitle: true,
            elevation: 0,
            title: Text(
              'Notifications'.tr,
              style: TextStyle(
                fontSize: 20.sp,
                color: ColorManager.black,
              ),
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: PagedListView<int, n.Notification>.separated(
            padding: const EdgeInsets.all(16).r,
            scrollDirection: Axis.vertical,
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate<n.Notification>(
              itemBuilder: (context1, item, index) {
                return NotificationCard(
                  notification: item,
                );
              },
              firstPageProgressIndicatorBuilder: (_) =>  Center(
                child: CircularProgressIndicator(
                  color: context.theme.primaryColor,
                ),
              ),
              newPageProgressIndicatorBuilder: (_) =>  Center(
                child: CircularProgressIndicator(
                  color: context.theme.primaryColor,
                ),
              ),
              noItemsFoundIndicatorBuilder: (_) => Center(
                child: EmptyWidget(
                  message: "NoNotifications".tr,
                ),
              ),
              newPageErrorIndicatorBuilder: (_) => ErrorPageIndicator(
                message: controller.pagingController.error,
                press: () => controller.pagingController.refresh(),
              ),
              firstPageErrorIndicatorBuilder: (_) => ErrorPageIndicator(
                message: controller.pagingController.error,
                press: () => controller.pagingController.refresh(),
              ),
              noMoreItemsIndicatorBuilder: (_) => const NoMoreItems(),
            ),
            separatorBuilder: (context, index) => 16.verticalSpace,
          ),
        );
      },
    );
  }
}
