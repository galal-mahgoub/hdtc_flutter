import 'package:hdtc_on/features/category_feature/domain/use_cases/get_trend_categories_use_case.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/utils.dart';
import '../../../domain/entities/category.dart';
import '../../../domain/use_cases/get_all_categories_use_case.dart';

class CategoriesController extends GetxController {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetTrendCategoriesUseCase getTrendCategoriesUseCase;
  CategoriesController({
    required this.getAllCategoriesUseCase,
    required this.getTrendCategoriesUseCase,
  });

  bool isLoading = false;
  bool isTrendLoading = false;

  List<Category> categories = [];
  List<Category> trendCategories = [];

  Future<void> getAllCategories() async {
    isLoading = true;
    update();

    var result = await getAllCategoriesUseCase();

    result.fold((failure) {
      isLoading = false;
      update();

      Utils.mapFailureToMessage(failure);
    }, (result) async {
      categories = result;
      isLoading = false;
      update();
    });
  }

  Future<void> getTrendCategories() async {
    isTrendLoading = true;
    update();

    var result = await getTrendCategoriesUseCase();

    result.fold((failure) {
      isTrendLoading = false;
      update();

      Utils.mapFailureToMessage(failure);
    }, (result) async {
      trendCategories = result;
      isTrendLoading = false;
      update();
    });
  }

  @override
  void onInit() async {
    await Future.wait([
      getAllCategories(),
      getTrendCategories(),
    ]);
    super.onInit();
  }
}
