import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/consts/k_strings.dart';
import '../../../../../core/languages/app_translations.dart';
import '../../../../../core/theme/color_manager.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../controllers/register_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: context.theme.primaryColor,
          body: CustomLoading(
            widget: Form(
              key: controller.formKey,
              child: CustomScrollView(
                slivers: [
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
                            LocaleKeys.registerTitle.tr,
                            style: TextManager.font24WhiteW600,
                          ),
                          8.verticalSpace,
                          Text(
                            LocaleKeys.registerDesc.tr,
                            style: TextManager.font14WhiteW400,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.whiteColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          topRight: Radius.circular(24.r),
                        ),
                      ),
                      padding: const EdgeInsets.all(24).r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// FULL NAME
                          Text(
                            LocaleKeys.fullName.tr,
                            style: TextManager.font16Text300W400,
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

                          /// PHONE NUMBER
                          Text(
                            LocaleKeys.phoneNumber.tr,
                            style: TextManager.font16Text300W400,
                          ),
                          8.verticalSpace,
                          CustomTextField(
                            controller: controller.phoneCtrl,
                            hintText: LocaleKeys.phoneNumber.tr,
                            maxLines: 1,
                            prefixWidget: Directionality(
                              textDirection: TextDirection.ltr,
                              child: CountryCodePicker(
                                enabled: false,
                                textStyle: TextManager.font16Text300W400,
                                dialogTextStyle: TextManager.font16Text300W400,
                                favorite: const [
                                  'QA',
                                  'KW',
                                  'SA',
                                  'AE',
                                  'OM',
                                  'BH',
                                  'EG'
                                ],
                                onChanged: (value) =>
                                    controller.setCountry(value),
                                padding: EdgeInsets.zero,
                                initialSelection: controller.countryCode.code ??
                                    Kstrings.defCountryCode,
                                dialogSize: Size(Get.width, Get.height),
                              ),
                            ),
                            // TODO: to add subscribtions
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return LocaleKeys.emptyPhoneNumber.tr;
                            //   }
                            //   // else if (!value.isEmail) {
                            //   //   return LocaleKeys.incorrectEmailAddress.tr;
                            //   // }

                            //   return null;
                            // },
                          ),
                          24.verticalSpace,

                          /// PASSWORD
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
                          24.verticalSpace,

                          /// CONFIRM PASSWORD
                          Text(
                            LocaleKeys.confirmPassword.tr,
                            style: TextManager.font16Text300W400,
                          ),
                          8.verticalSpace,
                          CustomTextField(
                            controller: controller.confirmPassCtrl,
                            hintText: LocaleKeys.confirmPassword.tr,
                            maxLines: 1,
                            isObSecure: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return LocaleKeys.emptyConfirmPassword.tr;
                              } else if (value !=
                                  controller.passwordCtrl.text) {
                                return LocaleKeys.passwordDontMatch.tr;
                              }
                              return null;
                            },
                          ),
                          24.verticalSpace,
                          CustomButton(
                            onPressed: () => controller.register(),
                            width: context.width,
                            text: LocaleKeys.continuee.tr,
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                LocaleKeys.alreadyHaveAccount.tr,
                                style: TextManager.font16Text200W400,
                              ),
                              const SizedBox(width: 4),
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
