import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../../core/consts/api_urls.dart';
import '../../../../core/network/handler.dart';

abstract class BaseLanguageRemoteDataSource {
  Future<Unit> changeLanguage({
    required String lang,
    required String? token,
  });
}

class LanguageRemoteDataSource extends GetConnect
    implements BaseLanguageRemoteDataSource {
  @override
  Future<Unit> changeLanguage({
    required String lang,
    required String? token,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var body = {
      'language': lang.toUpperCase(),
    };
    Response response = await put(
      ApiUrls.changeLanguage,
      json.encode(body),
      headers: ApiUrls.getHeaders(
        token: token,
      ),
    );

    return await Handler.responeHandler(response, Future.value(unit));
  }
}
