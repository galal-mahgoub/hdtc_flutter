import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_back_btn.dart';
import 'package:hdtc_on/core/widgets/custom_button.dart';
import 'package:hdtc_on/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/services/user_service.dart';
import '../../../../../core/widgets/empty_widget.dart';
import '../controller/cart_controller.dart';
import 'components/add_coupon_bottom_sheet.dart';
import 'components/cart_card.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return CustomLoading(
          widget: Scaffold(
            backgroundColor: ColorManager.white11,
            appBar: AppBar(
              backgroundColor: ColorManager.white11,
              centerTitle: true,
              elevation: 0,
              title: Text(
                'Cart'.tr,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.black,
                ),
              ),
              leadingWidth: 80,
              leading: const CustomBackBtn(),
            ),
            body: controller.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: context.theme.primaryColor,
                    ),
                  )
                : controller.cart == null || controller.cart!.items.isEmpty
                    ? SizedBox(
                        width: 1.sw,
                        child: EmptyWidget(
                          message: 'CartEmpty'.tr,
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.cart!.items.length,
                        itemBuilder: (context, index) {
                          return CartCard(
                            onDeletePressed: (p0) => controller.deleteCartItem(
                                controller.cart!.items[index].id.toString()),
                            item: controller.cart!.items[index],
                          );
                        },
                      ),
            bottomNavigationBar: controller.isLoading || controller.cart == null
                ? null
                : Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.r),
                          topLeft: Radius.circular(15.r)),
                      color: ColorManager.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal'.tr,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: ColorManager.black,
                              ),
                            ),
                            Text(
                              '${(controller.cart?.amounts.subTotalString ?? 0)}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: ColorManager.black9,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount'.tr,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: ColorManager.black,
                              ),
                            ),
                            Text(
                              '${(controller.cart?.amounts.totalDiscountString ?? 0)}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: ColorManager.black9,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${'Tax'.tr}(${(controller.cart?.amounts.tax ?? 0)}%)',
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: ColorManager.black,
                              ),
                            ),
                            Text(
                              '${(controller.cart?.amounts.taxPriceString ?? 0)}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: ColorManager.black9,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total'.tr,
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: ColorManager.black,
                              ),
                            ),
                            Text(
                              '${(controller.cart?.amounts.totalString ?? 0)}',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: ColorManager.black9,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                isLoading: controller.isCheckoutLoading,
                                height: 40.h,
                                onPressed: () => controller.checkout(),
                                text: 'Checkout'.tr,
                                borderRadius: 16.r,
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Expanded(
                              child: CustomButton(
                                height: 40.h,
                                onPressed: () {
                                  controller.couponCtrl.text = '';

                                  Get.bottomSheet(
                                    const AddCouponBottomsheet(),
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                  );
                                },
                                color: ColorManager.white,
                                borderColor: UserService.to.isKsa.value
                                    ? Colors.green[400]
                                    : ColorManager.green,
                                text: 'AddCoupon'.tr,
                                textColor: UserService.to.isKsa.value
                                    ? Colors.green[400]
                                    : ColorManager.green,
                                borderRadius: 16.r,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
          ),
          isLoading: controller.isDeleteLoading || controller.isCheckoutLoading,
        );
      },
    );
  }
}
