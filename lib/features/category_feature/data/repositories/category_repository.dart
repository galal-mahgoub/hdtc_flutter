import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/handler.dart';
import '../../domain/repositories/base_category_repository.dart';
import '../data_sources/category_remote_data_source.dart';
import '../models/category_course_model.dart';
import '../models/category_model.dart';

class CategoryRespoitory implements BaseCategoryRepository {
  final BaseCategoryRemoteDataSource baseCategoryRemoteDataSource;
  final FirebaseMessaging firebaseMessaging;
  final Handler handler;

  CategoryRespoitory({
    required this.baseCategoryRemoteDataSource,
    required this.firebaseMessaging,
    required this.handler,
  });

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    return handler.asyncHandler<List<CategoryModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCategoryRemoteDataSource.getCategories(
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getTrendCategories() async {
    return handler.asyncHandler<List<CategoryModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCategoryRemoteDataSource.getTrendCategories(
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, CategoryCourseModel>> getCategoryCourses({
    Map<String, Object>? query,
    required String categoryId,
  }) async {
    return handler.asyncHandler<CategoryCourseModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCategoryRemoteDataSource.getCategoryCourses(
        query: query,
        categoryId: categoryId,
        token: token,
        lang: lang,
      );

      return data;
    });
  }
}
