import 'package:get/get.dart';

import '../../../domain/use_cases/delete_favorites_use_case.dart';
import '../../../domain/use_cases/get_favorites_use_case.dart';
import '../controller/favourites_controller.dart';

class FavouritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GetFavoriteUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => DeleteFavoriteUseCase(
        baseOthersRepository: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut<FavouritesController>(
      () => FavouritesController(
        getFavoriteUseCase: Get.find(),
        deleteFavoriteUseCase: Get.find(),
      ),
      fenix: true,
    );
  }
}
