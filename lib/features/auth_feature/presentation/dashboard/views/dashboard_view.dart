import 'package:hdtc_on/core/services/user_service.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import 'components/info_dashboard_widget.dart';
import 'components/learning_statistics_widget.dart';
import 'components/notices_widget.dart';

class DashboardView extends GetView<UserService> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ColorManager.white),
          onPressed: () => Get.back(),
        ),
        shape: Border(
          bottom: BorderSide(
            color: context.theme.primaryColor,
          ),
        ),
        actions: [
          8.horizontalSpace,
          InkWell(
            onTap: () => UserService.to.currentUser.value == null
                ? Get.toNamed(Routes.login)
                : Get.toNamed(Routes.cart),
            borderRadius: BorderRadius.all(
              Radius.circular(13.r),
            ),
            child: Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: ColorManager.blackOpacity,
                    borderRadius: BorderRadius.all(
                      Radius.circular(13.r),
                    ),
                  ),
                  child: Icon(
                    Icons.shopping_cart_rounded,
                    size: 20.sp,
                    color: ColorManager.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          InkWell(
            onTap: () => Get.toNamed(Routes.notifications),
            borderRadius: BorderRadius.all(
              Radius.circular(13.r),
            ),
            child: Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: ColorManager.blackOpacity,
                    borderRadius: BorderRadius.all(Radius.circular(13.r)),
                  ),
                  child: Icon(
                    Icons.notifications_rounded,
                    size: 20.sp,
                    color: ColorManager.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 220.h,
              child: Stack(
                children: [
                  Container(
                    height: 140.h,
                    decoration: BoxDecoration(
                      color: context.theme.primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25.r),
                          bottomLeft: Radius.circular(25.r)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.r, vertical: 5.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${'hi'.tr} ${controller.currentUser.value?.fullName} 👋',
                                maxLines: 1,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 20.sp,
                                  color: ColorManager.white,
                                ),
                              ),
                              Text(
                                '${'youHaveNew'.tr} ${controller.quickInfo.value?.unreadNotifications?.count ?? 0} ${'events'.tr}',
                                maxLines: 1,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13.sp,
                                  color: ColorManager.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.r),
                          height: 140.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (context, index) {
                                return index == 0
                                    ? InfoDashboardWidget(
                                        backgroundIconColor:
                                            ColorManager.red1.withOpacity(.5),
                                        icon: Icon(
                                          Icons.mail,
                                          color: ColorManager.red,
                                          size: 20.sp,
                                        ),
                                        value: controller
                                            .quickInfo.value?.supportsCount
                                            .toString(),
                                        name: 'supportMessages'.tr,
                                      )
                                    : index == 1
                                        ? InfoDashboardWidget(
                                            backgroundIconColor: ColorManager
                                                .blue5
                                                .withOpacity(.5),
                                            icon: Icon(
                                              Icons.account_balance_wallet,
                                              color: ColorManager.blue6,
                                              size: 20.sp,
                                            ),
                                            value:
                                                controller.quickInfo.value !=
                                                            null &&
                                                        controller
                                                                .quickInfo
                                                                .value!
                                                                .roleName ==
                                                            'user'
                                                    ? controller
                                                        .quickInfo
                                                        .value!
                                                        .reserveMeetingsCount
                                                        .toString()
                                                    : controller
                                                        .quickInfo
                                                        .value!
                                                        .monthlySalesCount
                                                        .toString(),
                                            name: controller.quickInfo.value!
                                                        .roleName ==
                                                    'user'
                                                ? 'BusinessConsultations'.tr
                                                : 'MonthlySalesAmount'.tr,
                                          )
                                        : index == 2
                                            ? InfoDashboardWidget(
                                                backgroundIconColor:
                                                    (UserService.to.isKsa.value
                                                            ? Colors.green[400]
                                                            : ColorManager
                                                                .green)!
                                                        .withOpacity(.5),
                                                icon: Icon(
                                                  FontAwesomeIcons
                                                      .solidCommentDots,
                                                  color: ColorManager.green5,
                                                  size: 20.sp,
                                                ),
                                                value: controller.quickInfo
                                                    .value?.commentsCount
                                                    .toString(),
                                                name: 'Comments'.tr,
                                              )
                                            : const SizedBox();
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 15.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LearningStatistics'.tr,
                    style:
                        TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const LearningStatisticsWidget(),
                  SizedBox(
                    height: 25.h,
                  ),
                ],
              ),
            ),
            if (controller.quickInfo.value!.unreadNoticeboards != null &&
                controller.quickInfo.value!.unreadNoticeboards!.isNotEmpty) ...[
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 15.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notices'.tr,
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              const NoticesWidget(),
            ],
            SizedBox(
              height: 25.h,
            ),
          ],
        ),
      ),
    );
  }
}
