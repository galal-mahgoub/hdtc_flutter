import 'package:hdtc_on/core/services/user_service.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/utils/utils.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../controllers/meeting_details_controller.dart';
import 'components/btn_more_meeting_details_bottom_sheet_widget.dart';
import 'components/information_meeting_details_widget.dart';
import 'components/join_meeting_bottom_sheet.dart';
import 'components/title_with_content_widget.dart';

class MeetingDetailsView extends GetView<MeetingDetailsController> {
  const MeetingDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white13,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'MeetingDetails'.tr,
          style: TextManager.font16Text300W600,
        ),
        leadingWidth: 80,
        leading: const CustomBackBtn(),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          Center(
            child: Container(
              height: 130.r,
              width: 130.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: controller.item!.status == 'canceled'
                      ? ColorManager.red
                      : controller.item!.status == 'finished'
                          ? context.theme.primaryColor
                          : ColorManager.yellow,
                  width: 5.w,
                ),
              ),
              child: ClipOval(
                child: CustomImage(
                  path: controller.item!.user.avatar.isNotEmpty
                      ? controller.item!.user.avatar
                      : null,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            controller.item!.user.fullName,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: ColorManager.black,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            controller.item!.user.roleName == 'teacher'
                ? 'Instructor'.tr
                : controller.item!.user.roleName == 'consultant'
                    ? 'Consultant'.tr
                    : '',
            style: TextStyle(
              fontSize: 11.sp,
              color: ColorManager.grey,
            ),
          ),
          controller.item!.status == 'canceled' ||
                  controller.item!.status == 'finished'
              ? Container()
              : Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        controller.item!.user.mobile != null &&
                                controller.item!.user.mobile!.isNotEmpty
                            ? InkWell(
                                onTap: () {
                                  if (controller.item!.user.mobile != null) {
                                    Utils.makePhoneCall(
                                        controller.item!.user.mobile!);
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsetsDirectional.only(
                                    end: 10.r,
                                  ),
                                  padding: EdgeInsets.all(15.r),
                                  decoration: BoxDecoration(
                                    color: (UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green)!.withOpacity(.3),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.call,
                                    size: 20.sp,
                                    color:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                                  ),
                                ),
                              )
                            : Container(),
                        controller.item!.user.mobile != null &&
                                controller.item!.user.mobile!.isNotEmpty
                            ? SizedBox(
                                width: 10.w,
                              )
                            : Container(),
                        controller.item!.user.email != null &&
                                controller.item!.user.email!.isNotEmpty
                            ? InkWell(
                                onTap: () {
                                  if (controller.item!.user.email != null) {
                                    Utils.launchMail(
                                        controller.item!.user.email!);
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsetsDirectional.only(
                                    end: 10.r,
                                  ),
                                  padding: EdgeInsets.all(15.r),
                                  decoration: BoxDecoration(
                                    color: ColorManager.blue6.withOpacity(.3),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.mail,
                                    size: 20.sp,
                                    color: ColorManager.blue6,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
          SizedBox(
            height: 15.h,
          ),
          const InformationMeetingDetailsWidget(),
          SizedBox(
            height: 15.h,
          ),
          controller.item!.description != null &&
                  controller.item!.description!.isNotEmpty
              ? TitlteWithContentWidget(
                  title: 'Description'.tr,
                  content: controller.item!.description ?? '')
              : Container(),
          SizedBox(
            height: 10.h,
          ),
          controller.item!.user.address != null &&
                  controller.item!.user.address!.isNotEmpty
              ? TitlteWithContentWidget(
                  title: 'Notes'.tr,
                  content: controller.item!.user.address!,
                )
              : Container(),
        ],
      ),
      bottomNavigationBar: controller.item!.status == 'finished'
          ? null
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.r),
                    topLeft: Radius.circular(15.r)),
                color: ColorManager.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonWidget(
                      colorBtn:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                      text: Text(
                        controller.item!.status == 'canceled'
                            ? 'Canceled'.tr
                            : controller.item!.status == 'finished'
                                ? 'Finished'.tr
                                : controller.item!.link != null &&
                                        controller.item!.link!.isNotEmpty
                                    ? 'JoinMeeting'.tr
                                    : 'StartMeeting'.tr,
                        style: TextStyle(
                            fontSize: 15.sp, color: ColorManager.white),
                      ),
                      onPressed: controller.item!.status != 'canceled' &&
                              controller.item!.status != 'finished' &&
                              controller.item!.link != null &&
                              controller.item!.link!.isNotEmpty
                          ? () {
                              if (controller.item!.status != 'canceled' &&
                                  controller.item!.status != 'finished') {
                                if (controller.item!.link!.isNotEmpty) {
                                  Get.toNamed(
                                    Routes.webView,
                                    arguments: {'url': controller.item!.link},
                                  );
                                }
                              }
                            }
                          : null,
                      width: 1.sw,
                      paddingHorizontal: 10,
                      paddingVertical: 10,
                      radius: 10,
                    ),
                  ),
                  controller.item!.status != 'canceled' &&
                          controller.item!.status != 'finished'
                      ? SizedBox(
                          width: 10.w,
                        )
                      : Container(
                          height: 0,
                        ),
                  controller.item!.status != 'canceled' &&
                          controller.item!.status != 'finished'
                      ? IconButton(
                          onPressed: () {
                            controller.urlController.text = '';
                            controller.passController.text = '';
                            controller.isPasswordLogin = false;

                            UserService.to.currentUser.value!.roleName == 'user'
                                ? Get.bottomSheet(
                                    const BtnMoreMeetingDetailsBottomSheetCustom(),
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                  )
                                : Get.bottomSheet(
                                    const JoinMeetingBottomSheetCustom(),
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                  );
                          },
                          icon: Container(
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  color: ColorManager.green4, width: 1.w),
                              color: Colors.transparent,
                            ),
                            child: Icon(
                              Icons.more_horiz,
                              size: 27.sp,
                              color: ColorManager.green4,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
    );
  }
}
