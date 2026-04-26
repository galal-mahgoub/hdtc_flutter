import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/widgets/custom_text_field.dart';

import '../../../../../../core/languages/app_translations.dart';
import '../../../../../../core/theme/text_manager.dart';
import '../../controllers/update_profile_controller.dart';

class GeneralWidget extends StatelessWidget {
  const GeneralWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateProfileController>(
      builder: (controller) {
        return Form(
          key: controller.formKeyGeneral,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// EMAIL
              Text(
                LocaleKeys.email.tr,
                style: TextManager.font14Text300W400,
              ),
              8.verticalSpace,
              CustomTextField(
                enabled: false,
                controller: controller.emailCtrl,
                hintText: LocaleKeys.emailHint.tr,
                maxLines: 1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.emptyEmailAddress.tr;
                  } else if (!value.isEmail) {
                    return LocaleKeys.incorrectEmailAddress.tr;
                  }

                  return null;
                },
              ),
              24.verticalSpace,

              /// FULL NAME
              Text(
                LocaleKeys.fullName.tr,
                style: TextManager.font14Text300W400,
              ),
              8.verticalSpace,
              CustomTextField(
                controller: controller.nameCtrl,
                hintText: LocaleKeys.fullName.tr,
                maxLines: 1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.emptyFullName.tr;
                  }

                  return null;
                },
              ),
              24.verticalSpace,

              /// PHONE NUMBER
              Text(
                LocaleKeys.phoneNumber.tr,
                style: TextManager.font14Text300W400,
              ),
              8.verticalSpace,
              CustomTextField(
                controller: controller.phoneCtrl,
                hintText: LocaleKeys.phoneNumber.tr,
                maxLines: 1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.emptyPhoneNumber.tr;
                  }

                  return null;
                },
              ),
              24.verticalSpace,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'JoinNewsletter'.tr,
                    style: TextManager.font14Text300W400,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Switch(
                    value: controller.switchNewsletter,
                    onChanged: (value) {
                      controller.switchNewsletter = value;
                      controller.update();
                    },
                    activeColor:context.theme.primaryColor,
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ProfileMessages'.tr,
                    style: TextManager.font14Text300W400,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Switch(
                    value: controller.switchProfileMessages,
                    onChanged: (value) {
                      controller.switchProfileMessages = value;
                      controller.update();
                    },
                    activeColor:context.theme.primaryColor,
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SupportSignLanguage'.tr,
                    style: TextManager.font14Text300W400,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Switch(
                    value: controller.switchSupportSignLanguage,
                    onChanged: (value) {
                      controller.switchSupportSignLanguage = value;
                      controller.update();
                    },
                    activeColor:context.theme.primaryColor,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
