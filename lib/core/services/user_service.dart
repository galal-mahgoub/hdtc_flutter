import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../../features/auth_feature/domain/entities/quick_info.dart';
import '../../features/auth_feature/domain/entities/user.dart';
import '../../features/auth_feature/domain/use_cases/get_country_use_case.dart';
import '../../features/auth_feature/domain/use_cases/get_quick_info_use_case.dart';
import '../../features/auth_feature/domain/use_cases/get_user_data_use_case.dart';
import '../consts/enums.dart';
import 'language_service.dart';

class UserService extends GetxService {
  GetUserDataUseCase getUserDataUseCase;
  GetQuickInfoUseCase getQuickInfoUseCase;
  GetCountryUseCase getCountryUseCase;

  UserService({
    required this.getUserDataUseCase,
    required this.getQuickInfoUseCase,
    required this.getCountryUseCase,
  });

  static UserService get to => Get.find();

  Rx<User?> currentUser = Rx(null);
  Rx<QuickInfo?> quickInfo = Rx(null);
  final statisticDashBoard = <FlSpot>[].obs;
  final currentIndexSliderNoticeDashBoard = 0.obs;
  Rx<bool> isKsa = Rx(false);

  Future<UserService> init() async {
    await getCountry();
    await Future.value([
      getUser(),
    ]);

    currentUser.listen((p0) async {
      if (p0 != null) {
        await getQuickInfo();
      } else {
        quickInfo.value = null;
      }
    });

    return this;
  }

  Future getUser() async {
    final result = await getUserDataUseCase();

    result.fold((failure) {}, (user) async {
      currentUser.value = user;
      await getQuickInfo();
      LanguageService.to.savedLang.value =
          checkLanguage(user.language?.toLowerCase() ?? 'en');
    });
  }

  Future getCountry() async {
    final result = await getCountryUseCase();

    result.fold((failure) {}, (data) async {
      isKsa.value = data;
    });
  }

  Future getQuickInfo() async {
    final result = await getQuickInfoUseCase();

    result.fold((failure) {}, (result) async {
      quickInfo.value = result;
      statisticDashBoard.clear();
      if (result.monthlyChart != null) {
        for (int i = 1; i < 13; i++) {
          statisticDashBoard.add(
            FlSpot(
              i.toDouble(),
              result.monthlyChart!.data[i - 1].toDouble(),
            ),
          );
        }
      }
    });
  }
}
