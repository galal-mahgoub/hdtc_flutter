import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/languages/app_translations.dart';
import 'package:hdtc_on/core/services/user_service.dart';

import '../../../../../core/consts/assets.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/theme/color_manager.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/custom_image.dart';
import '../controllers/settings_controller.dart';
import 'components/change_language_dialog.dart';
import 'components/logout_alert_dialog.dart';
import 'components/settings_list_tile.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Settings'.tr,
              style: TextManager.font16Text300W600,
            ),
            actions: [
              InkWell(
                onTap: () => Get.toNamed(Routes.notifications),
                borderRadius: BorderRadius.all(
                  Radius.circular(13.r),
                ),
                child: Container(
                  height: 40.r,
                  width: 40.r,
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.all(Radius.circular(13.r)),
                  ),
                  child: Icon(
                    Icons.notifications_rounded,
                    size: 20.sp,
                    color: ColorManager.black,
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16).r,
            children: [
              Obx(
                () {
                  if (UserService.to.currentUser.value == null) {
                    return const SizedBox.shrink();
                  }
                  return Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 64.r,
                            width: 64.r,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2.r,
                                color: ColorManager.whiteColor,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: CustomImage(
                                path: (UserService
                                                .to.currentUser.value?.avatar !=
                                            null &&
                                        UserService.to.currentUser.value!.avatar
                                            .isNotEmpty)
                                    ? UserService.to.currentUser.value!.avatar
                                    : Assets.defaultAvatarImg,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          16.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  UserService.to.currentUser.value?.fullName ??
                                      '',
                                  style: TextManager.font16Text300W600,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                8.verticalSpace,
                                Text(
                                  UserService.to.currentUser.value?.email ?? '',
                                  style: TextManager.font12Text100W400,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          16.horizontalSpace,
                          InkWell(
                            onTap: () => Get.toNamed(Routes.updateProfile),
                            borderRadius: BorderRadius.all(
                              Radius.circular(13.r),
                            ),
                            child: Container(
                              height: 40.r,
                              width: 40.r,
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13.r)),
                              ),
                              child: Icon(
                                Icons.edit,
                                size: 20.sp,
                                color: ColorManager.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      24.verticalSpace,
                    ],
                  );
                },
              ),
              SettingsListTile(
                onTap: () => UserService.to.currentUser.value != null
                    ? Get.toNamed(Routes.dashboard)
                    : Get.toNamed(Routes.login)?.then(
                        (value) {
                          if (value != null) Get.toNamed(Routes.dashboard);
                        },
                      ),
                icon: Icons.show_chart,
                title: "DashBoard".tr,
              ),
              16.verticalSpace,
              SettingsListTile(
                onTap: () => UserService.to.currentUser.value != null
                    ? Get.toNamed(Routes.blogs)
                    : Get.toNamed(Routes.login)?.then(
                        (value) {
                          if (value != null) Get.toNamed(Routes.blogs);
                        },
                      ),
                icon: Icons.rss_feed,
                title: "Blogs".tr,
              ),
              16.verticalSpace,
              SettingsListTile(
                onTap: () => UserService.to.currentUser.value != null
                    ? Get.toNamed(Routes.meeting)
                    : Get.toNamed(Routes.login)?.then(
                        (value) {
                          if (value != null) Get.toNamed(Routes.meeting);
                        },
                      ),
                icon: Icons.calendar_month,
                title: "BusinessConsultations".tr,
              ),
              16.verticalSpace,
              SettingsListTile(
                onTap: () => UserService.to.currentUser.value != null
                    ? Get.toNamed(Routes.certificates)
                    : Get.toNamed(Routes.login)?.then(
                        (value) {
                          if (value != null) Get.toNamed(Routes.certificates);
                        },
                      ),
                icon: Icons.workspace_premium,
                title: "Certificates".tr,
              ),
              16.verticalSpace,
              SettingsListTile(
                onTap: () => UserService.to.currentUser.value != null
                    ? Get.toNamed(Routes.favorites)
                    : Get.toNamed(Routes.login)?.then(
                        (value) {
                          if (value != null) Get.toNamed(Routes.favorites);
                        },
                      ),
                icon: Icons.favorite,
                title: "Favorites".tr,
              ),
              16.verticalSpace,
              SettingsListTile(
                onTap: () => UserService.to.currentUser.value != null
                    ? Get.toNamed(Routes.comments)
                    : Get.toNamed(Routes.login)?.then(
                        (value) {
                          if (value != null) Get.toNamed(Routes.comments);
                        },
                      ),
                icon: Icons.comment,
                title: "Comments".tr,
              ),
              16.verticalSpace,
              // TODO: to add subscribtions
              Obx(
                () {
                  if (UserService.to.currentUser.value != null &&
                      UserService.to.currentUser.value!.organId != '0') {
                    return const SizedBox();
                  }

                  return Column(
                    children: [
                      SettingsListTile(
                        onTap: () => UserService.to.currentUser.value != null
                            ? Get.toNamed(Routes.subscribes)
                            : Get.toNamed(Routes.login)?.then(
                                (value) {
                                  if (value != null) {
                                    Get.toNamed(Routes.subscribes);
                                  }
                                },
                              ),
                        icon: Icons.subscriptions,
                        title: "Subscription".tr,
                      ),
                      16.verticalSpace,
                    ],
                  );
                },
              ),
              SettingsListTile(
                onTap: () => UserService.to.currentUser.value != null
                    ? Get.toNamed(Routes.videos)
                    : Get.toNamed(Routes.login)?.then(
                        (value) {
                          if (value != null) Get.toNamed(Routes.videos);
                        },
                      ),
                icon: Icons.play_circle,
                title: "Videos".tr,
              ),
              16.verticalSpace,
              SettingsListTile(
                onTap: () => UserService.to.currentUser.value != null
                    ? Get.toNamed(Routes.support)
                    : Get.toNamed(Routes.login)?.then(
                        (value) {
                          if (value != null) Get.toNamed(Routes.support);
                        },
                      ),
                icon: Icons.email,
                title: "Support".tr,
              ),
              16.verticalSpace,
              SettingsListTile(
                onTap: () => Get.dialog(
                  ChangeLanguageDialog(
                    onTapClose: () => Get.back(),
                    onTapAr: () => controller.onChangeLang(lang: 'ar'),
                    onTapEn: () => controller.onChangeLang(lang: 'en'),
                  ),
                  barrierDismissible: true,
                ),
                icon: Icons.language,
                title: LocaleKeys.selectLangTitle.tr,
              ),
              16.verticalSpace,
              Obx(
                () {
                  if (UserService.to.currentUser.value == null) {
                    return SettingsListTile(
                      onTap: () => Get.toNamed(Routes.login),
                      icon: Icons.login,
                      iconColor: ColorManager.greenColor,
                      title: LocaleKeys.login.tr,
                      titleColor: ColorManager.greenColor,
                      trailing: const SizedBox(),
                    );
                  }
                  return SettingsListTile(
                    onTap: () => Get.dialog(
                      barrierDismissible: false,
                      const LogoutAlertDialog(),
                    ),
                    icon: Icons.logout,
                    iconColor: ColorManager.red,
                    title: "Logout".tr,
                    titleColor: ColorManager.red,
                    trailing: const SizedBox(),
                  );
                },
              ),
              16.verticalSpace,
            ],
          ),
        );
      },
    );
  }
}
