import 'package:get/get.dart';

import '../../../domain/use_cases/check_subscription_use_case.dart';
import '../../../domain/use_cases/get_subscribes_use_case.dart';
import '../../../domain/use_cases/get_summerys_use_case.dart';
import '../controllers/subscribes_controller.dart';

class SubscribesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetSubscribesUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetSummaryUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => CheckSubscriptionUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<SubscribesController>(
      () => SubscribesController(
        getSubscribesUseCase: Get.find(),
        getSummaryUseCase: Get.find(),
        checkSubscriptionUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
