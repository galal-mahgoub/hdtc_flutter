import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_back_btn.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:hdtc_on/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/services/user_service.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../controllers/update_profile_controller.dart';
import 'components/general_widget.dart';
import 'components/localization_widget.dart';
import 'components/security_widget.dart';

class UpdateProfileView extends GetView<UserService> {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateProfileController>(
      builder: (updateProfileController) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Setting'.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: CustomLoading(
            widget: Obx(
              () {
                return ListView(
                  children: [
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(16.r),
                      children: [
                        Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () => updateProfileController
                                          .changeProfileImg(),
                                      customBorder: const CircleBorder(),
                                      child: Container(
                                        height: 96.r,
                                        width: 96.r,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: ColorManager.yellow,
                                            width: 5.r,
                                            strokeAlign: 1,
                                          ),
                                        ),
                                        child: ClipOval(
                                          child: CustomImage(
                                            path: UserService
                                                .to.currentUser.value!.avatar,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 96.r,
                                      height: 16.r,
                                      color: Colors.transparent,
                                    ),
                                  ],
                                ),
                                Positioned(
                                  right: 0,
                                  left: 0,
                                  bottom: 0,
                                  child: InkWell(
                                    onTap: () => updateProfileController
                                        .changeProfileImg(),
                                    customBorder: const CircleBorder(),
                                    child: Container(
                                      height: 32.r,
                                      width: 32.r,
                                      decoration: const BoxDecoration(
                                        color: ColorManager.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: ColorManager.grey,
                                        size: 16.sp,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              controller.currentUser.value!.fullName,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.black,
                              ),
                            ),
                            Text(
                              (controller.currentUser.value!.roleName == 'user'
                                      ? 'user'.tr
                                      : controller
                                              .currentUser.value!.roleName ??
                                          '')
                                  .toUpperCase(),
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: ColorManager.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        CustomSlidingSegmentedControl<int>(
                          customSegmentSettings: CustomSegmentSettings(
                            borderRadius: BorderRadius.circular(36.r),
                          ),
                          isStretch: true,
                          innerPadding: const EdgeInsets.all(8).r,
                          initialValue: updateProfileController.currentIndex,
                          children: {
                            0: Text(
                              "General".tr,
                              style: updateProfileController.currentIndex == 0
                                  ? TextManager.font14WhiteW500
                                  : TextManager.font14Text75W400.copyWith(
                                      color: (UserService.to.isKsa.value
                                          ? Colors.green[400]
                                          : ColorManager.green),
                                    ),
                            ),
                            1: Text(
                              "Security".tr,
                              style: updateProfileController.currentIndex == 1
                                  ? TextManager.font14WhiteW500
                                  : TextManager.font14Text75W400.copyWith(
                                      color: (UserService.to.isKsa.value
                                          ? Colors.green[400]
                                          : ColorManager.green),
                                    ),
                            ),
                            2: Text(
                              "Localization".tr,
                              style: updateProfileController.currentIndex == 2
                                  ? TextManager.font14WhiteW500
                                  : TextManager.font14Text75W400.copyWith(
                                      color: (UserService.to.isKsa.value
                                          ? Colors.green[400]
                                          : ColorManager.green),
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
                            color: (UserService.to.isKsa.value
                                ? Colors.green[400]
                                : ColorManager.green),
                            borderRadius: BorderRadius.circular(28.r),
                          ),
                          curve: Curves.linear,
                          onValueChanged: (value) =>
                              updateProfileController.changeViewIndex(value),
                        ),
                        16.verticalSpace,
                        ExpandablePageView(
                          controller: updateProfileController.pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: const [
                            GeneralWidget(),
                            SecurityWidget(),
                            LocalizationWidget(),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.r),
                            topLeft: Radius.circular(15.r)),
                        color: ColorManager.white,
                      ),
                      child: ButtonWidget(
                        colorBtn: context.theme.primaryColor,
                        text: Text(
                          'Save'.tr,
                          style: TextStyle(
                              fontSize: 16.sp, color: ColorManager.white),
                        ),
                        onPressed: () => updateProfileController.saveBtn(),
                        width: 1.sw,
                        paddingHorizontal: 10,
                        paddingVertical: 10,
                        marginHorizontal: 5,
                        marginVertical: 10,
                        radius: 10,
                      ),
                    ),
                  ],
                );
              },
            ),
            isLoading: updateProfileController.isLoading,
          ),
        );
      },
    );
  }
}
