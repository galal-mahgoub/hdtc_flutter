import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/category.dart';
import '../repositories/base_category_repository.dart';

class GetTrendCategoriesUseCase {
  final BaseCategoryRepository baseCategoryRepository;

  GetTrendCategoriesUseCase({required this.baseCategoryRepository});

  Future<Either<Failure, List<Category>>> call() async {
    return await baseCategoryRepository.getTrendCategories();
  }
}
