import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:hdtc_on/core/languages/app_translations.dart';
import 'package:hdtc_on/core/services/user_service.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/utils/toast_manager.dart';
import 'package:hdtc_on/core/widgets/custom_back_btn.dart';
import 'package:hdtc_on/core/widgets/custom_loading.dart';
import 'package:hdtc_on/core/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../controller/courses_details_controller.dart';
import 'components/add_comment_bottom_sheet_widget.dart';
import 'components/add_course_alert_dialog.dart';
import 'components/add_review_bottom_sheet_widget.dart';
import 'components/app_bar_course_details_widget.dart';
import 'components/comments_widget.dart';
import 'components/content_widget.dart';
import 'components/information_course_details_widget.dart';
import 'components/review_widget.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesDetailsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.white13,
          appBar: AppBar(
            backgroundColor: ColorManager.white13,
            centerTitle: true,
            title: Text(
              'CourseDetails'.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: CustomLoading(
            widget: controller.course == null
                ? const SizedBox()
                : ListView(
                    padding: const EdgeInsets.symmetric(vertical: 16).r,
                    children: [
                      if (controller.course!.activeSpecialOffer != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16).r,
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10.r),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.r),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(11.r),
                                        border: Border.all(
                                            color: ColorManager.grey6)),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10.r),
                                                decoration: BoxDecoration(
                                                  color: context
                                                      .theme.primaryColor,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  Icons.percent,
                                                  size: 20.sp,
                                                  color: ColorManager.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Text(
                                                'Special\nOffer'.tr,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: context
                                                      .theme.primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Expanded(
                                          child: TimerCountdown(
                                            format: CountDownTimerFormat
                                                .daysHoursMinutesSeconds,
                                            daysDescription: 'D'.tr,
                                            hoursDescription: 'H'.tr,
                                            minutesDescription: 'M'.tr,
                                            secondsDescription: 'S'.tr,
                                            spacerWidth: 5.w,
                                            descriptionTextStyle: TextStyle(
                                              color: ColorManager.grey5,
                                              fontSize: 11.sp,
                                            ),
                                            timeTextStyle: TextStyle(
                                              color: context.theme.primaryColor,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            endTime: DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    controller
                                                            .course!
                                                            .activeSpecialOffer!
                                                            .toDate! *
                                                        1000),
                                            onEnd: () {},
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 20.r),
                                      padding: EdgeInsets.all(10.r),
                                      decoration: BoxDecoration(
                                        color: context.theme.primaryColor,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.r)),
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            '${controller.course!.activeSpecialOffer!.percent}%',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: ColorManager.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Off'.tr,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: ColorManager.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16).r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.course!.title,
                              style: TextStyle(
                                color: ColorManager.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '${'In'.tr} ${controller.course!.category}',
                                    style: TextStyle(
                                        color: ColorManager.grey5,
                                        fontSize: 13.sp),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                CustomRatingBar(
                                  value: controller.course!.rate ?? 0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      16.verticalSpace,
                      const AppBarCourseDetailsWidget(),
                      16.verticalSpace,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16).r,
                        child: CustomSlidingSegmentedControl<int>(
                          customSegmentSettings: CustomSegmentSettings(
                            borderRadius: BorderRadius.circular(36.r),
                          ),
                          isStretch: true,
                          innerPadding: const EdgeInsets.all(8).r,
                          initialValue: controller.currentIndex,
                          children: {
                            0: Text(
                              "Information".tr,
                              style: controller.currentIndex == 0
                                  ? TextManager.font14WhiteW500
                                  : TextManager.font14Text75W400.copyWith(
                                      color: UserService.to.isKsa.value
                                          ? Colors.green[400]
                                          : ColorManager.green,
                                    ),
                            ),
                            1: Text(
                              "Content".tr,
                              style: controller.currentIndex == 1
                                  ? TextManager.font14WhiteW500
                                  : TextManager.font14Text75W400.copyWith(
                                      color: UserService.to.isKsa.value
                                          ? Colors.green[400]
                                          : ColorManager.green,
                                    ),
                            ),
                            2: Text(
                              "Reviews".tr,
                              style: controller.currentIndex == 2
                                  ? TextManager.font14WhiteW500
                                  : TextManager.font14Text75W400.copyWith(
                                      color: UserService.to.isKsa.value
                                          ? Colors.green[400]
                                          : ColorManager.green,
                                    ),
                            ),
                            3: Text(
                              "Comments".tr,
                              style: controller.currentIndex == 3
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
                            color: UserService.to.isKsa.value
                                ? Colors.green[400]!.withOpacity(.1)
                                : ColorManager.green.withOpacity(.1),
                            borderRadius: BorderRadius.circular(36.r),
                          ),
                          thumbDecoration: BoxDecoration(
                            color: UserService.to.isKsa.value
                                ? Colors.green[400]
                                : ColorManager.green,
                            borderRadius: BorderRadius.circular(28.r),
                          ),
                          curve: Curves.linear,
                          onValueChanged: (value) =>
                              controller.changeViewIndex(value),
                        ),
                      ),
                      16.verticalSpace,
                      ExpandablePageView(
                        controller: controller.pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          InformationCourseDetailsWidget(),
                          ContentWidget(),
                          ReviewWidget(),
                          CommentsWidget(),
                        ],
                      ),
                    ],
                  ),
            isLoading: controller.isQuizLoading ||
                controller.isLoading ||
                controller.course == null,
          ),
          bottomNavigationBar: controller.isLoading || controller.course == null
              ? const SizedBox()
              : (controller.currentIndex == 0 || controller.currentIndex == 1)
                  ? Container(
                      padding: EdgeInsets.only(top: 12.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.r),
                            topLeft: Radius.circular(15.r)),
                        color: ColorManager.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          if (controller.course!.authHasBought)
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${controller.course!.progress}% ${'Completed'.tr}',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: ColorManager.grey9,
                                          ),
                                        ),
                                      ),
                                      if (controller.course!.free ?? false)
                                        Text(
                                          'Free'.tr,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: UserService.to.isKsa.value
                                                ? Colors.green[400]
                                                : ColorManager.green,
                                          ),
                                        ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  LinearProgressIndicator(
                                    value:
                                        (controller.course!.progressPercent ??
                                                0) /
                                            100,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.r)),
                                    minHeight: 5.h,
                                    color: ColorManager.yellow,
                                    backgroundColor: Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                          ButtonWidget(
                            isLoading: controller.isNoticesLoading ||
                                controller.isForumLoading,
                            colorBtn: UserService.to.isKsa.value
                                ? Colors.green[400]
                                : ColorManager.green,
                            text: Text(
                              controller.course!.displayButton ==
                                      'go_to_learning_page_button'
                                  ? 'GoLearning'.tr
                                  : controller.course!.displayButton ==
                                          'enroll_course_button'
                                      ? 'EnrollClass'.tr
                                      : 'Subscribe'.tr,
                              style: TextStyle(
                                  fontSize: 13.sp, color: ColorManager.white),
                            ),
                            onPressed: () async {
                              if (UserService.to.currentUser.value == null) {
                                Get.toNamed(Routes.login)?.then((value) {
                                  if (value != null) {
                                    controller.initData();
                                  }
                                });
                              } else {
                                if (controller.course!.displayButton ==
                                    'go_to_learning_page_button') {
                                  Get.toNamed(
                                    Routes.newLearningPage,
                                    arguments: {
                                      'course': controller.course,
                                      'contents': controller.contents,
                                    },
                                  );
                                } else if (controller.course!.displayButton ==
                                    'enroll_course_button') {
                                  Get.dialog(
                                    const AddCourseAlertDialog(),
                                    barrierDismissible: false,
                                  );
                                } else if (controller.course!.displayButton ==
                                    'subscribe_button') {
                                  ToastManager.showError(
                                      LocaleKeys.openPlatformToSubscribe.tr);
                                  // TODO: to add subscribtions
                                  await Get.toNamed(Routes.subscribes)
                                      ?.then((value) => controller.initData());
                                }
                              }
                            },
                            width: 1.sw,
                            paddingHorizontal: 10,
                            paddingVertical: 10,
                            marginHorizontal: 10,
                            marginVertical: 10,
                            radius: 10,
                          ),
                        ],
                      ),
                    )
                  : controller.course!.authHasBought &&
                          controller.currentIndex == 2
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15.r),
                                topLeft: Radius.circular(15.r)),
                            color: ColorManager.white,
                          ),
                          child: ButtonWidget(
                            colorBtn: UserService.to.isKsa.value
                                ? Colors.green[400]
                                : ColorManager.green,
                            text: Text(
                              'WriteReview'.tr,
                              style: TextStyle(
                                  fontSize: 13.sp, color: ColorManager.white),
                            ),
                            onPressed: () {
                              controller.descriptionReviewController.text = '';
                              controller.contentQualityReview = 0;
                              controller.instructorSkillsReview = 0;
                              controller.purchaseWorthReview = 0;
                              controller.supportQualityReview = 0;

                              Get.bottomSheet(
                                const AddReviewBottomSheetCustom(),
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                              );
                            },
                            width: 1.sw,
                            paddingHorizontal: 10,
                            paddingVertical: 10,
                            marginHorizontal: 15,
                            marginVertical: 5,
                            radius: 10,
                          ),
                        )
                      : controller.course!.authHasBought &&
                              controller.currentIndex == 3
                          ? Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15.r),
                                    topLeft: Radius.circular(15.r)),
                                color: ColorManager.white,
                              ),
                              child: ButtonWidget(
                                colorBtn: UserService.to.isKsa.value
                                    ? Colors.green[400]
                                    : ColorManager.green,
                                text: Text(
                                  'LeaveComment'.tr,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: ColorManager.white),
                                ),
                                onPressed: () {
                                  controller.messageCommentController.text = '';

                                  Get.bottomSheet(
                                    AddCommentBottomSheetCustom(
                                      id: controller.course!.id.toString(),
                                      type: 'add',
                                    ),
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                  );
                                },
                                width: 1.sw,
                                paddingHorizontal: 10,
                                paddingVertical: 10,
                                marginHorizontal: 15,
                                marginVertical: 5,
                                radius: 10,
                              ),
                            )
                          : const SizedBox(),
        );
      },
    );
  }
}
