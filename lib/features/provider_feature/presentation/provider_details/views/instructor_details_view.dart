import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:hdtc_on/core/services/user_service.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/widgets/custom_back_btn.dart';

import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../controllers/instructor_details_controller.dart';
import 'components/about_instructor.dart';
import 'components/badges_instructor.dart';
import 'components/calendar_bottom_sheet_widget.dart';
import 'components/courses_instructor.dart';
import 'components/instructor_appbar.dart';
import 'components/meeting_widget.dart';

class InstructorDetailsView extends StatelessWidget {
  const InstructorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InstructorDetailsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.white13,
          appBar: AppBar(
            backgroundColor: ColorManager.white13,
            centerTitle: true,
            title: Text(
              'profile'.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: controller.isLoading
              ?  Center(
                  child: CircularProgressIndicator(
                    color: context.theme.primaryColor,
                  ),
                )
              : ListView(
                  padding: EdgeInsets.all(16.r),
                  children: [
                    const InstructorAppBar(),
                    16.verticalSpace,
                    CustomSlidingSegmentedControl<int>(
                      customSegmentSettings: CustomSegmentSettings(
                        borderRadius: BorderRadius.circular(36.r),
                      ),
                      isStretch: true,
                      innerPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ).r,
                      initialValue: controller.currentIndex,
                      children: {
                        0: Text(
                          "About".tr,
                          style: controller.currentIndex == 0
                              ? TextManager.font14WhiteW500
                              : TextManager.font14Text75W400.copyWith(
                                  color: UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green,
                                ),
                        ),
                        1: Text(
                          "Badges".tr,
                          style: controller.currentIndex == 1
                              ? TextManager.font14WhiteW500
                              : TextManager.font14Text75W400.copyWith(
                                  color:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                                ),
                        ),
                        2: controller.provider!.roleName == 'consultant'
                            ? Text(
                                "Meeting".tr,
                                style: controller.currentIndex == 2
                                    ? TextManager.font14WhiteW500
                                    : TextManager.font14Text75W400.copyWith(
                                        color: UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green,
                                      ),
                              )
                            : Text(
                                "Courses".tr,
                                style: controller.currentIndex == 2
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
                      onValueChanged: (value) => controller.changeIndex(value),
                    ),
                    16.verticalSpace,
                    ExpandablePageView(
                      controller: controller.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const AboutInstructor(),
                        const BadgesListWidget(),
                        controller.provider!.roleName == 'consultant'
                            ? const MeetingWidget()
                            : const CoursesInstructor(),
                      ],
                    ),
                  ],
                ),
          bottomNavigationBar: UserService.to.currentUser.value == null
              ? null
              : Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.r),
                        topLeft: Radius.circular(15.r)),
                    color: ColorManager.white,
                  ),
                  child: controller.provider!.roleName == 'consultant' &&
                          controller.currentIndex == 2
                      ? ButtonWidget(
                          colorBtn:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                          text: Text(
                            'ReverseMeeting'.tr,
                            style: TextStyle(
                                fontSize: 13.sp, color: ColorManager.white),
                          ),
                          onPressed: () {
                            controller.getMeetingDetailsOfDate();

                            Get.bottomSheet(
                              const CalendarBottomSheetCustom(),
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                            );
                          },
                          width: 1.sw,
                          paddingHorizontal: 10,
                          paddingVertical: 10,
                          marginHorizontal: 10,
                          radius: 15,
                        )
                      : ButtonWidget(
                          colorBtn: UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green,
                          isLoading: controller.isFollowLoading,
                          text: Text(
                            controller.provider!.followers
                                    .where((element) =>
                                        element.id ==
                                        UserService.to.currentUser.value?.id)
                                    .isNotEmpty
                                ? 'Unfollow'.tr
                                : 'Follow'.tr,
                            style: TextStyle(
                                fontSize: 13.sp, color: ColorManager.white),
                          ),
                          onPressed: () => controller.followInstructor(),
                          width: 1.sw,
                          paddingHorizontal: 10,
                          marginHorizontal: 10,
                          paddingVertical: 10,
                          radius: 15,
                        ),
                ),
        );
      },
    );
  }
}
