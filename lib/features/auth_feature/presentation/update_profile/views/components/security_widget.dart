import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/languages/app_translations.dart';

import '../../../../../../core/theme/text_manager.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../controllers/update_profile_controller.dart';

class SecurityWidget extends StatelessWidget {
  const SecurityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateProfileController>(
      builder: (controller) {
        return Form(
          key: controller.formKeySecurity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// OLD PASSWORD
              Text(
                LocaleKeys.oldPassword.tr,
                style: TextManager.font14Text300W400,
              ),
              8.verticalSpace,
              CustomTextField(
                controller: controller.oldPassCtrl,
                hintText: LocaleKeys.oldPassword.tr,
                maxLines: 1,
                isObSecure: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.emptyPassword.tr;
                  } else if (value.length < 6) {
                    return LocaleKeys.morePasswordChars.tr;
                  }
                  return null;
                },
              ),
              24.verticalSpace,

              /// NEW PASSWORD
              Text(
                LocaleKeys.newPassword.tr,
                style: TextManager.font14Text300W400,
              ),
              8.verticalSpace,
              CustomTextField(
                controller: controller.newPassCtrl,
                hintText: LocaleKeys.newPassword.tr,
                maxLines: 1,
                isObSecure: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.emptyPassword.tr;
                  } else if (value.length < 6) {
                    return LocaleKeys.morePasswordChars.tr;
                  }
                  return null;
                },
              ),
              24.verticalSpace,

              /// NEW CONFIRM PASSWORD
              Text(
                LocaleKeys.newConfirmPassword.tr,
                style: TextManager.font14Text300W400,
              ),
              8.verticalSpace,
              CustomTextField(
                controller: controller.newConfirmPassCtrl,
                hintText: LocaleKeys.newConfirmPassword.tr,
                maxLines: 1,
                isObSecure: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return LocaleKeys.emptyNewConPassword.tr;
                  } else if (value != controller.newPassCtrl.text) {
                    return LocaleKeys.newPasswordDontMatch.tr;
                  }

                  return null;
                },
              ),
              24.verticalSpace,
            ],
          ),
        );
      },
    );
  }
}
