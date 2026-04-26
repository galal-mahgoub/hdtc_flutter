import 'package:get/get.dart';

import '../../../domain/use_cases/download_certificate_use_case.dart';
import '../controllers/certificate_details_controller.dart';

class CertificateDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DownloadCertificateUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut<CertificateDetailsController>(
      () => CertificateDetailsController(
        downloadCertificateUseCase: Get.find(),
      ),
    );
  }
}
