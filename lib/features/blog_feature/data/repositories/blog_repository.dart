import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/handler.dart';
import '../../domain/repositories/base_blog_repository.dart';
import '../data_source/blog_remote_data_source.dart';
import '../models/blog_category_model.dart';
import '../models/blog_model.dart';

class BlogRespoitory implements BaseBlogRepository {
  final BaseBlogRemoteDataSource baseAuthRemoteDataSource;
  final FirebaseMessaging firebaseMessaging;
  final Handler handler;

  BlogRespoitory({
    required this.baseAuthRemoteDataSource,
    required this.firebaseMessaging,
    required this.handler,
  });

  @override
  Future<Either<Failure, List<BlogModel>>> blogs({
    required String? offset,
    required String? limit,
    required int? categoryId,
  }) async {
    return handler.asyncHandler<List<BlogModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseAuthRemoteDataSource.blogs(
        offset: offset,
        limit: limit,
        categoryId: categoryId,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<BlogCategoryModel>>> blogsCategories() async {
    return handler.asyncHandler<List<BlogCategoryModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseAuthRemoteDataSource.blogsCategories(
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> sendBlogComment({
    required String blodId,
    required String comment,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseAuthRemoteDataSource.sendBlogComment(
        blodId: blodId,
        comment: comment,
        token: token,
        lang: lang,
      );

      return data;
    });
  }
}
