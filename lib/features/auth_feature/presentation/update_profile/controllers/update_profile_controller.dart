import 'dart:io';

import 'package:hdtc_on/core/languages/app_translations.dart';
import 'package:hdtc_on/core/services/user_service.dart';
import 'package:hdtc_on/features/auth_feature/domain/use_cases/change_password_use_case.dart';
import 'package:hdtc_on/features/auth_feature/domain/use_cases/update_localization_use_case.dart';
import 'package:hdtc_on/features/auth_feature/domain/use_cases/update_profile_img_use_case.dart';
import 'package:hdtc_on/features/auth_feature/domain/use_cases/update_profile_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/get_cities_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/get_countries_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/get_districts_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/get_provinces_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/get_time_zones_use_case.dart';
import 'package:hdtc_on/features/provider_feature/domain/entities/reservation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../others_feature/domain/entities/country.dart';

class UpdateProfileController extends GetxController {
  GetTimeZonesUseCase getTimeZonesUseCase;
  GetCountriesUseCase getCountriesUseCase;
  GetProvincesUseCase getProvincesUseCase;
  GeCitiesUseCase geCitiesUseCase;
  GetDistrictsUseCase getDistrictsUseCase;
  UpdateProfileUseCase updateProfileUseCase;
  UpdateProfileImgUseCase updateProfileImgUseCase;
  ChangePasswordUseCase changePasswordUseCase;
  UpdateLocalizationUseCase updateLocalizationUseCase;
  UpdateProfileController({
    required this.getTimeZonesUseCase,
    required this.getCountriesUseCase,
    required this.getProvincesUseCase,
    required this.geCitiesUseCase,
    required this.getDistrictsUseCase,
    required this.updateProfileUseCase,
    required this.updateProfileImgUseCase,
    required this.changePasswordUseCase,
    required this.updateLocalizationUseCase,
  });

  static UpdateProfileController get to => Get.find();

  late PageController pageController;
  GlobalKey<FormState> formKeyGeneral = GlobalKey<FormState>();
  GlobalKey<FormState> formKeySecurity = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyLocalization = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController oldPassCtrl = TextEditingController();
  TextEditingController newPassCtrl = TextEditingController();
  TextEditingController newConfirmPassCtrl = TextEditingController();
  TextEditingController srchTimeZoneCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();

  int currentIndex = 0;
  File imageProfile = File('');

  bool isLoading = false;
  Reservation? reservation;
  List<String> timezones = [];
  List<Country> countries = [];
  List<Country> provinces = [];
  List<Country> cities = [];
  List<Country> districts = [];

  bool switchNewsletter = false;
  bool switchProfileMessages = false;
  bool switchSupportSignLanguage = false;
  String selectedValueTimeZone = 'SelectTimeZone'.tr;
  Country selectedValueCountries = Country(
    title: 'SelectCountry'.tr,
    id: '0',
  );
  Country selectedValueProvinces = Country(
    title: 'SelectProvince'.tr,
    id: '0',
  );
  Country selectedValueCities = Country(
    title: 'SelectCities'.tr,
    id: '0',
  );
  Country selectedValueDistrict = Country(
    title: 'SelectDistrict'.tr,
    id: '0',
  );

  changeViewIndex(int value) {
    currentIndex = value;
    pageController.animateToPage(
      value,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 200),
    );
    update();
  }

  Future<void> getTimezones() async {
    var result = await getTimeZonesUseCase();

    result.fold((failure) {
      Utils.mapFailureToMessage(failure);
    }, (result) {
      timezones = result;
    });
  }

  Future<void> getCountries() async {
    selectedValueProvinces = Country(
      title: 'SelectProvince'.tr,
      id: '0',
    );
    selectedValueCities = Country(
      title: 'SelectCities'.tr,
      id: '0',
    );
    selectedValueDistrict = Country(
      title: 'SelectDistrict'.tr,
      id: '0',
    );
    update();
    var result = await getCountriesUseCase();

    result.fold((failure) {
      Utils.mapFailureToMessage(failure);
    }, (result) async {
      countries = result;
      final country = countries.firstWhereOrNull(
          (e) => e.id == (UserService.to.currentUser.value?.countryId ?? '0'));
      if (country != null) {
        selectedValueCountries = country;
        await getProvinces(country.id, isFirstLoading: true);
      }
    });
  }

  Future<void> getProvinces(String countryId,
      {bool isFirstLoading = false}) async {
    selectedValueProvinces = Country(
      title: 'SelectProvince'.tr,
      id: '0',
    );
    selectedValueCities = Country(
      title: 'SelectCities'.tr,
      id: '0',
    );
    selectedValueDistrict = Country(
      title: 'SelectDistrict'.tr,
      id: '0',
    );
    if (!isFirstLoading) {
      isLoading = true;
      update();
    }

    var result = await getProvincesUseCase(countryId: countryId);

    result.fold((failure) {
      if (!isFirstLoading) {
        isLoading = false;
        update();
      }

      Utils.mapFailureToMessage(failure);
    }, (result) async {
      provinces = result;
      final province = provinces.firstWhereOrNull(
          (e) => e.id == (UserService.to.currentUser.value?.provinceId ?? '0'));
      if (province != null) {
        selectedValueProvinces = province;
        await getCities(province.id);
      }
      if (!isFirstLoading) {
        isLoading = false;
        update();
      }
    });
  }

  Future<void> getCities(String provinceId,
      {bool isFirstLoading = false}) async {
    selectedValueCities = Country(
      title: 'SelectCities'.tr,
      id: '0',
    );
    selectedValueDistrict = Country(
      title: 'SelectDistrict'.tr,
      id: '0',
    );
    if (!isFirstLoading) {
      isLoading = true;
      update();
    }
    var result = await geCitiesUseCase(provinceId: provinceId);

    result.fold((failure) {
      if (!isFirstLoading) {
        isLoading = false;
        update();
      }

      Utils.mapFailureToMessage(failure);
    }, (result) async {
      cities = result;
      final city = cities.firstWhereOrNull(
          (e) => e.id == (UserService.to.currentUser.value?.cityId ?? '0'));
      if (city != null) {
        selectedValueCities = city;
        await getDistricts(city.id);
      }
      if (!isFirstLoading) {
        isLoading = false;
        update();
      }
    });
  }

  Future<void> getDistricts(String cityId,
      {bool isFirstLoading = false}) async {
    selectedValueDistrict = Country(
      title: 'SelectDistrict'.tr,
      id: '0',
    );
    if (!isFirstLoading) {
      isLoading = true;
      update();
    }

    var result = await getDistrictsUseCase(cityId: cityId);

    result.fold((failure) {
      if (!isFirstLoading) {
        isLoading = false;
        update();
      }

      Utils.mapFailureToMessage(failure);
    }, (result) {
      districts = result;
      final district = districts.firstWhereOrNull(
        (e) => e.id == (UserService.to.currentUser.value?.districtId ?? '0'),
      );
      if (district != null) {
        selectedValueDistrict = district;
      }
      if (!isFirstLoading) {
        isLoading = false;
        update();
      }
    });
  }

  Future<void> updateProfile() async {
    if (!formKeyGeneral.currentState!.validate()) {
      return;
    }

    isLoading = true;
    update();

    var result = await updateProfileUseCase(
      name: nameCtrl.text,
      mobile: phoneCtrl.text,
      newsletter: switchNewsletter,
      publicMessage: switchProfileMessages,
      supportSignLang: switchSupportSignLanguage,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      isLoading = false;
      update();
      UserService.to.currentUser.value!.fullName = nameCtrl.text;
      UserService.to.currentUser.value!.mobile = phoneCtrl.text;
      UserService.to.currentUser.value!.newsletter = switchNewsletter;
      UserService.to.currentUser.value!.publicMessage =
          switchProfileMessages ? '1' : '0';
      UserService.to.currentUser.value!.supportSignLanguage =
          switchSupportSignLanguage;
      UserService.to.currentUser.refresh();
      ToastManager.showSuccess(result);
    });
  }

  Future changeProfileImg() async {
    File? img = await Utils.pickPicture();

    if (img != null) updateProfileImg(img.path);
  }

  Future<void> updateProfileImg(String imgPath) async {
    isLoading = true;
    update();

    var result = await updateProfileImgUseCase(
      image: imgPath,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      isLoading = false;
      update();
      UserService.to.currentUser.value!.avatar = imgPath;
      UserService.to.currentUser.refresh();

      ToastManager.showSuccess(result);
    });
  }

  Future<void> changePassword() async {
    if (!formKeySecurity.currentState!.validate()) {
      return;
    }
    isLoading = true;
    update();

    var result = await changePasswordUseCase(
      oldPass: oldPassCtrl.text,
      pass: newPassCtrl.text,
      confirmPass: newConfirmPassCtrl.text,
    );

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      isLoading = false;
      oldPassCtrl.clear();
      newPassCtrl.clear();
      newConfirmPassCtrl.clear();
      update();

      ToastManager.showSuccess(LocaleKeys.passwordChangedSuccessfuly.tr);
    });
  }

  Future<void> updateLocalization() async {
    if (!formKeyLocalization.currentState!.validate()) {
      return;
    }
    isLoading = true;
    update();

    var result = await updateLocalizationUseCase(
      countryId: selectedValueCountries.id,
      provinceId: selectedValueProvinces.id,
      cityId: selectedValueCities.id,
      districtId: selectedValueDistrict.id,
      timezone: selectedValueTimeZone,
      address: addressCtrl.text,
    );

    UserService.to.currentUser.value!.fullName = nameCtrl.text;

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) {
      isLoading = false;
      update();
      UserService.to.currentUser.value!.timezone =
          selectedValueTimeZone == 'SelectTimeZone'.tr
              ? null
              : selectedValueTimeZone;
      UserService.to.currentUser.value!.countryId = selectedValueCountries.id;
      UserService.to.currentUser.value!.provinceId = selectedValueProvinces.id;
      UserService.to.currentUser.value!.cityId = selectedValueCities.id;
      UserService.to.currentUser.value!.districtId = selectedValueDistrict.id;
      UserService.to.currentUser.value!.address = addressCtrl.text;
      UserService.to.currentUser.refresh();

      ToastManager.showSuccess(result);
    });
  }

  saveBtn() {
    if (currentIndex == 0) {
      updateProfile();
    } else if (currentIndex == 1) {
      changePassword();
    } else if (currentIndex == 2) {
      updateLocalization();
    }
  }

  @override
  Future<void> onInit() async {
    pageController = PageController();

    await initialData();
    super.onInit();
  }

  Future initialData() async {
    isLoading = true;
    update();

    await Future.wait(
      [
        getTimezones(),
        getCountries(),
      ],
    );

    emailCtrl.text = UserService.to.currentUser.value!.email ?? '';
    nameCtrl.text = UserService.to.currentUser.value!.fullName;
    phoneCtrl.text = UserService.to.currentUser.value!.mobile ?? '';
    switchNewsletter = UserService.to.currentUser.value!.newsletter ?? false;
    switchProfileMessages =
        UserService.to.currentUser.value!.publicMessage == '1' ? true : false;
    switchSupportSignLanguage =
        UserService.to.currentUser.value!.supportSignLanguage ?? false;
    addressCtrl.text = UserService.to.currentUser.value!.address ?? '';
    selectedValueTimeZone =
        UserService.to.currentUser.value!.timezone ?? 'SelectTimeZone'.tr;
    isLoading = false;
    update();
  }

  @override
  void onClose() {
    pageController.dispose();
    emailCtrl.dispose();
    nameCtrl.dispose();
    phoneCtrl.dispose();
    oldPassCtrl.dispose();
    newConfirmPassCtrl.dispose();
    srchTimeZoneCtrl.dispose();
    addressCtrl.dispose();
    super.onClose();
  }
}
