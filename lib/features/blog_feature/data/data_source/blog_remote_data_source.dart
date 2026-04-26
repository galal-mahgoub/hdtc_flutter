import 'package:get/get.dart';

import '../../../../core/consts/api_urls.dart';
import '../../../../core/network/handler.dart';
import '../models/blog_category_model.dart';
import '../models/blog_model.dart';

abstract class BaseBlogRemoteDataSource {
  Future<List<BlogModel>> blogs({
    required String? offset,
    required String? limit,
    required int? categoryId,
    required String? token,
    required String? lang,
  });
  Future<List<BlogCategoryModel>> blogsCategories({
    required String? token,
    required String? lang,
  });

  Future<String> sendBlogComment({
    required String blodId,
    required String comment,
    required String? token,
    required String? lang,
  });
}

class BlogRemoteDataSource extends GetConnect
    implements BaseBlogRemoteDataSource {
  @override
  Future<List<BlogModel>> blogs({
    required String? offset,
    required String? limit,
    required int? categoryId,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      '${ApiUrls.blogs}?cat=${categoryId ?? ''}',
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler<List<BlogModel>?>(
      response,
      response.body?["data"] != null
          ? List.from(response.body['data'])
              .map((e) => BlogModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }

  @override
  Future<List<BlogCategoryModel>> blogsCategories({
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.blogsCategories,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler<List<BlogCategoryModel>?>(
      response,
      response.body?["data"] != null
          ? List.from(response.body['data'])
              .map((e) => BlogCategoryModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }

  @override
  Future<String> sendBlogComment({
    required String blodId,
    required String comment,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var data = {
      "item_id": blodId,
      "item_name": "blog",
      "comment": comment,
    };
    Response response = await post(
      ApiUrls.sendBlogComment,
      data,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );
    Get.log("sendBlogComment==>${response.bodyString}");
    return await Handler.responeHandler(
      response,
      response.body?['message'] ?? '',
    );
  }
}
