import 'package:hdtc_on/core/theme/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/languages/app_translations.dart';
import '../../../../../core/theme/color_manager.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../controllers/send_forgot_password_controller.dart';

class SendForgotPasswordView extends StatelessWidget {
  const SendForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SendForgotPasswordController>(
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
                    LocaleKeys.forgotPasswordTitle.tr,
                    style: TextManager.font24Text300W500,
                  ),
                  8.verticalSpace,
                  Text(
                    LocaleKeys.forgotPasswordDesc.tr,
                    style: TextManager.font14Text100W400,
                  ),
                  40.verticalSpace,

                  /// EMAIL
                  Text(
                    LocaleKeys.email.tr,
                    style: TextManager.font16Text300W400,
                  ),
                  8.verticalSpace,
                  CustomTextField(
                    controller: controller.emailCtrl,
                    hintText: LocaleKeys.emailHint.tr,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return LocaleKeys.emptyEmailAddress.tr;
                      } else if (!value.isEmail) {
                        return LocaleKeys.incorrectEmailAddress.tr;
                      }

                      return null;
                    },
                  ),
                  40.verticalSpace,
                  CustomButton(
                    isLoading: controller.isLoading,
                    onPressed: () => controller.sendCode(),
                    width: context.width,
                    text: LocaleKeys.continuee.tr,
                  ),

                  40.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.rememberPassword.tr,
                        style: TextManager.font16Text200W400,
                      ),
                      4.horizontalSpace,
                      InkWell(
                        onTap: () => Get.back(),
                        child: Text(
                          LocaleKeys.login.tr,
                          style: TextManager.font16Green3W600.copyWith(
                            color: context.theme.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  )
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
