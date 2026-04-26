import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/theme/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/languages/app_translations.dart';
import '../../../../../core/routes/app_pages.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: context.theme.primaryColor,
          body: CustomLoading(
            widget: Form(
              key: controller.formKey,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverPadding(
                    padding: EdgeInsets.only(
                      top: context.mediaQueryPadding.top + 24.h,
                      bottom: 24.h,
                      left: 24.w,
                      right: 24.w,
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              CustomBackBtn(),
                            ],
                          ),
                          24.verticalSpace,
                          Text(
                            LocaleKeys.loginTitle.tr,
                            style: TextManager.font24WhiteW600,
                          ),
                          8.verticalSpace,
                          Text(
                            LocaleKeys.loginDesc.tr,
                            style: TextManager.font14WhiteW400,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // use SliverFillRemaining to make this container fill up the remaining height?
                  SliverFillRemaining(
                    hasScrollBody:
                        false, // if using a column, so the widgets in it, doesn't scroll
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 32,
                        horizontal: 24,
                      ).r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                          Text(
                            LocaleKeys.password.tr,
                            style: TextManager.font16Text300W400,
                          ),
                          8.verticalSpace,
                          CustomTextField(
                            controller: controller.passwordCtrl,
                            hintText: LocaleKeys.password.tr,
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
                          16.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () => Get.toNamed(
                                  Routes.sendForgotPassword,
                                ),
                                child: Text(
                                  LocaleKeys.forgetPassword.tr,
                                  style: TextManager.font14Text300W400.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          40.verticalSpace,
                          CustomButton(
                            onPressed: () => controller.login(),
                            width: context.width,
                            text: LocaleKeys.login.tr,
                          ),
                          40.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                LocaleKeys.dontHaveAccount.tr,
                                style: TextManager.font16Text200W400,
                              ),
                              4.horizontalSpace,
                              InkWell(
                                onTap: () => Get.toNamed(Routes.register),
                                child: Text(
                                  LocaleKeys.register.tr,
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
                ],
              ),
            ),
            isLoading: controller.isLoading,
          ),
        );
      },
    );
  }
}
//  ListView(
//                 children = [
//                     ],
//               ),
