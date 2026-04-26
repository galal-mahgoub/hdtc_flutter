import 'package:get/get.dart';

import '../controllers/mainlayout_controller.dart';

class MainLayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainLayoutController>(
      () => MainLayoutController(),
    );
  }
}
