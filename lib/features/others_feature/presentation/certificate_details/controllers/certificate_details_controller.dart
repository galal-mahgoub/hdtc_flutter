import 'package:hdtc_on/features/others_feature/domain/use_cases/download_certificate_use_case.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';

class CertificateDetailsController extends GetxController {
  DownloadCertificateUseCase downloadCertificateUseCase;
  CertificateDetailsController({required this.downloadCertificateUseCase});
  String title = '',
      description = '',
      image = '',
      date = '',
      certificateId = '',
      yourGrade = '',
      passGrade = '',
      link = '',
      type = '';

  bool isLoading = false;

  Future<void> downloadCertificate() async {
    isLoading = true;
    update();
    var result = await downloadCertificateUseCase(
      downloadLink: link,
      title: title,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      isLoading = false;
      update();
    });
  }

  @override
  Future<void> onInit() async {
    title = Get.arguments['title'] ?? '';
    description = Get.arguments['description'] ?? '';
    image = Get.arguments['image'] ?? '';
    date = Get.arguments['date'] ?? '';
    certificateId = Get.arguments['certificateId'] ?? '';
    yourGrade = Get.arguments['yourGrade'] ?? '';
    passGrade = Get.arguments['passGrade'] ?? '';
    link = Get.arguments['link'] ?? '';
    type = Get.arguments['type'] ?? '';

    super.onInit();
  }
}
