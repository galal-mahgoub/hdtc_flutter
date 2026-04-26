import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/languages/app_translations.dart';
import '../../../../../core/theme/color_manager.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../controllers/verify_forgot_password_controller.dart';

class VerifyForgotPasswordView extends StatelessWidget {
  const VerifyForgotPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyForgotPasswordController>(
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
                    LocaleKeys.verifyCodeTitle.tr,
                    style: TextManager.font24Text300W500,
                  ),
                  8.verticalSpace,
                  Text(
                    LocaleKeys.verifyCodeDesc.tr,
                    style: TextManager.font14Text100W400,
                  ),
                  40.verticalSpace,
                  PinCodeTextField(
                    appContext: context,
                    autoDisposeControllers: false,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.scale,
                    animationDuration: const Duration(milliseconds: 300),
                    errorAnimationController: controller.errorController,
                    controller: controller.codeCtrl,
                    keyboardType: TextInputType.number,
                    enableActiveFill: true,
                    cursorHeight: 20.h,
                    textStyle: TextManager.font22DarkW700,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10.r),

                      // Error
                      errorBorderWidth: 1.w,
                      // Active
                      activeColor:context.theme.primaryColor,
                      activeFillColor: Colors.white,
                      activeBorderWidth: 1.w,
                      // Selected
                      selectedColor:context.theme.primaryColor,
                      selectedFillColor: Colors.white,
                      // Inactive
                      inactiveFillColor: const Color(0xffF7F8F9),
                      inactiveColor: const Color(0xffE8ECF4),
                      inactiveBorderWidth: 1.w,
                    ),
                    boxShadows: [
                      BoxShadow(
                        offset: Offset(0, 5.r),
                        color: ColorManager.text400Color,
                        blurRadius: 5,
                      )
                    ],
                    onCompleted: (v) => controller.verifyCode(),
                    onChanged: (String value) {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length != 6) {
                        return "";
                      }
                      return null;
                    },
                  ),
                  40.verticalSpace,
                  CustomButton(
                    isLoading: controller.isLoading,
                    onPressed: () => controller.verifyCode(),
                    width: context.width,
                    text: LocaleKeys.verifyCode.tr,
                  ),

                  40.verticalSpace,

                  /// Resend Code
                  controller.timeCounter == 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.didntReceiveCode.tr,
                              style: TextManager.font16Text200W400,
                            ),
                            const SizedBox(width: 4),
                            InkWell(
                              onTap: () => controller.resendCode(),
                              child: Text(
                                LocaleKeys.resend.tr,
                                style: TextManager.font16Secondary300W600,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.resendAfter.tr,
                              style: TextManager.font16Text200W400,
                            ),
                            Text(
                              " (00:${controller.timeCounter})",
                              style: TextManager.font16Text200W400,
                            ),
                          ],
                        ),
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
