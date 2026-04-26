import 'package:get/get.dart';

import '../controllers/providers_controller.dart';

class ProvidersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProvidersController>(
      () => ProvidersController(
        instructorsUseCase: Get.find(),
        businessConsultationsUseCase: Get.find(),
        getAllCategoriesUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
