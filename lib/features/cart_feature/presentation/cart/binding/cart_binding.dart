import 'package:get/get.dart';

import '../controller/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
      () => CartController(
        getCartListUseCase: Get.find(),
        deleteCartItemUseCase: Get.find(),
        checkCouponUseCase: Get.find(),
        checkoutUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
