import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/category.dart';
import '../repositories/base_category_repository.dart';

class GetAllCategoriesUseCase {
  final BaseCategoryRepository baseCategoryRepository;

  GetAllCategoriesUseCase({required this.baseCategoryRepository});

  Future<Either<Failure, List<Category>>> call() async {
    return await baseCategoryRepository.getCategories();
  }
}
