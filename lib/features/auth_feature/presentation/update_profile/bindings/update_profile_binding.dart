import 'package:get/get.dart';

import '../../../../others_feature/domain/use_cases/get_cities_use_case.dart';
import '../../../../others_feature/domain/use_cases/get_countries_use_case.dart';
import '../../../../others_feature/domain/use_cases/get_districts_use_case.dart';
import '../../../../others_feature/domain/use_cases/get_provinces_use_case.dart';
import '../../../../others_feature/domain/use_cases/get_time_zones_use_case.dart';
import '../../../domain/use_cases/change_password_use_case.dart';
import '../../../domain/use_cases/update_localization_use_case.dart';
import '../../../domain/use_cases/update_profile_img_use_case.dart';
import '../../../domain/use_cases/update_profile_use_case.dart';
import '../controllers/update_profile_controller.dart';

class UpdateProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetTimeZonesUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetCountriesUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetProvincesUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GeCitiesUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetDistrictsUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => UpdateProfileUseCase(
        baseAuthRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => UpdateProfileImgUseCase(
        baseAuthRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => ChangePasswordUseCase(
        baseAuthRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => UpdateLocalizationUseCase(
        baseAuthRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<UpdateProfileController>(
      () => UpdateProfileController(
        getTimeZonesUseCase: Get.find(),
        getCountriesUseCase: Get.find(),
        getProvincesUseCase: Get.find(),
        geCitiesUseCase: Get.find(),
        getDistrictsUseCase: Get.find(),
        updateProfileUseCase: Get.find(),
        updateProfileImgUseCase: Get.find(),
        changePasswordUseCase: Get.find(),
        updateLocalizationUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
