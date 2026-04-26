import 'package:get/get.dart';

import '../../../domain/use_cases/get_class_certificates_use_case.dart';
import '../../../domain/use_cases/get_completion_certificates_use_case.dart';
import '../controller/certificates_controller.dart';

class CertificatesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetCompletionCertificatesUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetClassCertificatesUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut<CertificatesController>(
      () => CertificatesController(
        getClassCertificatesUseCase: Get.find(),
        getCompletionCertificatesUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
