import 'package:hdtc_on/features/cart_feature/domain/use_cases/check_coupon_use_case.dart';
import 'package:hdtc_on/features/cart_feature/domain/use_cases/checkout_use_case.dart';
import 'package:hdtc_on/features/cart_feature/domain/use_cases/delete_cart_item_use_case.dart';
import 'package:hdtc_on/features/cart_feature/domain/use_cases/get_cart_list_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/cart.dart';

class CartController extends SuperController {
  GetCartListUseCase getCartListUseCase;
  DeleteCartItemUseCase deleteCartItemUseCase;
  CheckCouponUseCase checkCouponUseCase;
  CheckoutUseCase checkoutUseCase;
  CartController({
    required this.getCartListUseCase,
    required this.deleteCartItemUseCase,
    required this.checkCouponUseCase,
    required this.checkoutUseCase,
  });

  late GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController couponCtrl = TextEditingController();
  Cart? cart;

  bool isLoading = true;
  bool isCheckoutLoading = false;
  bool isDeleteLoading = false;
  bool isCouponLoading = false;

  Future<void> getCartList({bool forceLoading = true}) async {
    if (forceLoading) {
      isLoading = true;
      update();
    }

    var result = await getCartListUseCase();

    result.fold((failure) {
      isLoading = false;
      update();

      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      cart = result;

      if (couponCtrl.text.isNotEmpty) {
        checkCoupon(isReload: true);
      }

      isLoading = false;
      update();
    });
  }

  Future<void> deleteCartItem(String itemId) async {
    isDeleteLoading = true;
    update();

    var result = await deleteCartItemUseCase(itemId: itemId);

    result.fold((failure) {
      isDeleteLoading = false;
      update();

      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      await getCartList(forceLoading: false);

      isDeleteLoading = false;
      update();
    });
  }

  Future<void> checkCoupon({bool isReload = false}) async {
    if (!isReload) {
      if (!formKey.currentState!.validate()) {
        return;
      }
    }
    Get.focusScope?.unfocus();

    isCouponLoading = true;
    update();

    var result = await checkCouponUseCase(coupon: couponCtrl.text);

    result.fold((failure) {
      isCouponLoading = false;
      update();

      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      if (result != null) {
        if (result.discount != null) {
          cart!.discount = result.discount;
          cart!.amounts = result.amounts;
        }
      }

      if (Get.isBottomSheetOpen!) {
        Get.back();
      }

      isCouponLoading = false;
      update();
    });
  }

  Future<void> checkout() async {
    isCheckoutLoading = true;
    update();

    var result = await checkoutUseCase(
      couponId: cart?.discount?.id.toString(),
    );

    result.fold((failure) {
      isCheckoutLoading = false;
      update();

      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      Utils.launchInBrowser(result);
      isCheckoutLoading = false;
      update();
    });
  }

  @override
  void onInit() async {
    await getCartList();
    super.onInit();
  }

  @override
  void onClose() {
    couponCtrl.dispose();
    super.onClose();
  }

  @override
  void onDetached() {}

  @override
  void onHidden() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() async {
    Get.log("onResumedCart==>${couponCtrl.text}");
    await getCartList();
  }
}
