import 'package:hdtc_on/features/others_feature/domain/use_cases/delete_favorites_use_case.dart';
import 'package:hdtc_on/features/others_feature/domain/use_cases/get_favorites_use_case.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/toast_manager.dart';
import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/favorite.dart';

class FavouritesController extends GetxController {
  GetFavoriteUseCase getFavoriteUseCase;
  DeleteFavoriteUseCase deleteFavoriteUseCase;
  FavouritesController({
    required this.getFavoriteUseCase,
    required this.deleteFavoriteUseCase,
  });
  bool isLoading = false;
  bool isDeleteLoading = false;
  List<Favorite> favourites = [];

  Future<void> getFavorites() async {
    isLoading = true;
    update();
    var result = await getFavoriteUseCase();

    result.fold((failure) {
      isLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      favourites = result;
      isLoading = false;
      update();
    });
  }

  Future<void> deleteFavorite(String id) async {
    isDeleteLoading = true;
    update();
    var result = await deleteFavoriteUseCase(favId: id);

    result.fold((failure) {
      isDeleteLoading = false;
      update();
      ToastManager.showError(Utils.mapFailureToMessage(failure));
    }, (result) async {
      favourites.removeWhere((element) => element.id == id);
      isDeleteLoading = false;
      update();
      ToastManager.showSuccess(result);
    });
  }

  @override
  void onInit() async {
    await getFavorites();
    super.onInit();
  }
}
