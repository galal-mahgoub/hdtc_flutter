import 'package:get/get.dart';

import '../../../../../core/consts/api_urls.dart';
import '../../../../../core/network/handler.dart';
import '../models/category_course_model.dart';
import '../models/category_model.dart';

abstract class BaseCategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories({
    required String? token,
    required String? lang,
  });

  Future<List<CategoryModel>> getTrendCategories({
    required String? token,
    required String? lang,
  });

  Future<CategoryCourseModel> getCategoryCourses({
    Map<String, Object>? query,
    required String categoryId,
    required String? token,
    required String? lang,
  });
}

class CategoryRemoteDataSource extends GetConnect
    implements BaseCategoryRemoteDataSource {
  @override
  Future<List<CategoryModel>> getCategories({
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.allCategories,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"]["categories"] != null
          ? List.from(response.body['data']['categories'])
              .map((e) => CategoryModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }

  @override
  Future<List<CategoryModel>> getTrendCategories({
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.trendCategories,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"]["categories"] != null
          ? List.from(response.body['data']['categories'])
              .map((e) => CategoryModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }

  @override
  Future<CategoryCourseModel> getCategoryCourses({
    Map<String, Object>? query,
    required String categoryId,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.categoryCourses(categoryId: categoryId),
      query: query,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );
    
    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? CategoryCourseModel.fromJson(
              response.body['data'],
            )
          : [],
    );
  }
}
