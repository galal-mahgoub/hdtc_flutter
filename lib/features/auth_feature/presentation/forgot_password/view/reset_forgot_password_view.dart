
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/languages/app_translations.dart';
import '../../../../../core/theme/color_manager.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../controllers/reset_forgot_password_controller.dart';

class ResetForgotPasswordView extends StatelessWidget {
  const ResetForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResetForgotPasswordController>(
      builder: (controller) {
        return CustomLoading(
          widget: Scaffold(
            body: Form(
              key: controller.formKey,
              child: ListView(
                padding: EdgeInsets.only(
                  top: context.mediaQueryPadding.top + 24.h,
                  bottom: 24.h,
                  left: 24.w,
                  right: 24.w,
                ),
                children: [
                  const Row(
                    children: [
                      CustomBackBtn(
                        backgroundColor: ColorManager.textfieldBgColor,
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  Text(
                    LocaleKeys.resetForgotPasswordTitle.tr,
                    style: TextManager.font24Text300W500,
                  ),
                  8.verticalSpace,
                  Text(
                    LocaleKeys.resetForgotPasswordDesc.tr,
                    style: TextManager.font14Text100W400,
                  ),
                  40.verticalSpace,

                  /// New Password
                  Text(
                    LocaleKeys.newPassword.tr,
                    style: TextManager.font16Text300W400,
                  ),
                  8.verticalSpace,
                  CustomTextField(
                    controller: controller.passwordCtrl,
                    hintText: LocaleKeys.newPasswordHint.tr,
                    isObSecure: true,
                    maxLines: 1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.emptyPassword.tr;
                      } else if (value.length < 8) {
                        return LocaleKeys.morePasswordChars.tr;
                      }
                      return null;
                    },
                  ),
                  24.verticalSpace,

                  /// Confirm New Password
                  Text(
                    LocaleKeys.newPassword.tr,
                    style: TextManager.font16Text300W400,
                  ),
                  8.verticalSpace,
                  CustomTextField(
                    controller: controller.confirmPassCtrl,
                    hintText: LocaleKeys.newConfirmPasswordHint.tr,
                    maxLines: 1,
                    isObSecure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.emptyConfirmPassword.tr;
                      } else if (value != controller.passwordCtrl.text) {
                        return LocaleKeys.passwordDontMatch.tr;
                      }
                      return null;
                    },
                  ),
                  40.verticalSpace,
                  CustomButton(
                    isLoading: controller.isLoading,
                    onPressed: () => controller.resetPassword(),
                    width: context.width,
                    text: LocaleKeys.resetPassword.tr,
                  ),

                  40.verticalSpace,
                ],
              ),
            ),
          ),
          isLoading: controller.isLoading,
        );
      },
    );
  }
}
