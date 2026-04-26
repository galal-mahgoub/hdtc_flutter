import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/widgets/button_widget.dart';
import '../../controller/cart_controller.dart';

class AddCouponBottomsheet extends StatelessWidget {
  const AddCouponBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(top: 15.r),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsetsDirectional.only(end: 10.r),
                          padding: EdgeInsets.all(15.r),
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.r)),
                          ),
                          child: Icon(
                            Icons.close,
                            size: 22.sp,
                            color: ColorManager.black,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 1.sw,
                  padding: EdgeInsets.symmetric(
                    vertical: 24.r,
                    horizontal: 24.r,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    ),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AddCoupon'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: ColorManager.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                keyboardType: TextInputType.text,
                                hintText: 'CouponCode'.tr,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: const BorderSide(
                                      color: ColorManager.grey10),
                                ),
                                controller: controller.couponCtrl,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'EnterCouponCode'.tr;
                                  }
                                  return null;
                                },
                                onEditingComplete: () {
                                  FocusScope.of(context).unfocus();
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ButtonWidget(
                          isLoading: controller.isCouponLoading,
                          colorBtn: UserService.to.isKsa.value
                              ? Colors.green[400]
                              : ColorManager.green,
                          text: Text(
                            'Validate'.tr,
                            style: TextStyle(
                                fontSize: 15.sp, color: ColorManager.white),
                          ),
                          onPressed: () => controller.checkCoupon(),
                          width: 1.sw,
                          paddingHorizontal: 10,
                          paddingVertical: 10,
                          marginHorizontal: 5,
                          radius: 10,
                        ),
                      ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
