import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/utils/utils.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../../../core/services/user_service.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../../../../../core/widgets/text_wrapper.dart';
import '../controllers/certificate_details_controller.dart';

class CertificateDetailsView extends StatelessWidget {
  const CertificateDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CertificateDetailsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.white13,
          appBar: AppBar(
            backgroundColor: ColorManager.white13,
            centerTitle: true,
            title: Text(
              'Certificate Details'.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16).r,
            children: [
              Text(
                controller.title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.black,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextWrapper(
                text: controller.description,
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 190.h,
                width: 1.sw,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CustomImage(
                    path: controller.image.isNotEmpty ? controller.image : null,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  controller.type == 'quiz'
                      ? 'Share Certificate'.tr
                      : 'Certificate OverView'.tr,
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.black,
                  ),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 35.r),
                child: Text(
                  controller.type == 'quiz'
                      ? 'ShareCertificate'.tr
                      : 'EvaluateStudents'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: ColorManager.grey5,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              if (controller.type == 'quiz')
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: ColorManager.grey2,
                                radius: 17.r,
                                child: Icon(
                                  Icons.settings,
                                  color: ColorManager.grey9,
                                  size: 18.sp,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your Grade'.tr,
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: ColorManager.grey9,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    controller.yourGrade,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      color: ColorManager.black,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: ColorManager.grey2,
                                radius: 17.r,
                                child: Icon(
                                  Icons.done,
                                  color: ColorManager.grey9,
                                  size: 18.sp,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pass Grade'.tr,
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: ColorManager.grey9,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    controller.passGrade,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      color: ColorManager.black,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorManager.grey2,
                          radius: 17.r,
                          child: Icon(
                            Icons.calendar_month,
                            color: ColorManager.grey9,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Taken Date'.tr,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: ColorManager.grey9,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              DateFormat(
                                      'dd MMM yyyy',
                                      GetStorage()
                                              .read<String>('language_code') ??
                                          'EN')
                                  .format(DateTime.fromMillisecondsSinceEpoch(
                                      int.parse(controller.date) * 1000)),
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: ColorManager.grey2,
                          radius: 17.r,
                          child: Icon(
                            Icons.more_horiz,
                            color: ColorManager.grey9,
                            size: 18.sp,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Certificate ID'.tr,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: ColorManager.grey9,
                              ),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              controller.certificateId,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.black,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.r),
                  topLeft: Radius.circular(15.r)),
              color: ColorManager.white,
            ),
            child: ButtonWidget(
              isLoading: controller.isLoading,
              colorBtn: UserService.to.isKsa.value
                  ? Colors.green[400]
                  : ColorManager.green,
              colorBackground: UserService.to.isKsa.value
                  ? Colors.green[400]
                  : ColorManager.green,
              colorBorder: UserService.to.isKsa.value
                  ? Colors.green[400]
                  : ColorManager.green,
              text: Text(
                'Download'.tr,
                style: TextStyle(fontSize: 15.sp, color: ColorManager.white),
              ),
              onPressed: () {
                Utils.launchInBrowser(controller.link);
              },
              width: 1.sw,
              paddingHorizontal: 10,
              paddingVertical: 10,
              marginHorizontal: 5,
              radius: 15,
            ),
          ),
        );
      },
    );
  }
}
