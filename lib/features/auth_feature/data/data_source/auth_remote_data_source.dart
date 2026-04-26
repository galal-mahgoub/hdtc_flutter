import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/consts/api_urls.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/handler.dart';
import '../models/quick_info_model.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

import 'auth_local_data_source.dart';

abstract class BaseAuthRemoteDataSource {
  Future<bool> getCountry();

  Future<UserModel> getUserData({
    required String? userId,
    required String? token,
  });

  Future<UserModel> login({
    required BaseAuthLocalDataSource baseAuthLocalDataSource,
    required String email,
    required String password,
    required String fcmToken,
    required String? lang,
    required String? token,
  });

  Future<Unit> logOut({
    required String? token,
  });

  Future<UserModel> register({
    required String name,
    required String countryCode,
    required String mobile,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String lang,
    required String fcmToken,
  });

  Future<UserModel> verifyCode({
    required String userId,
    required String code,
    required String? token,
  });

  Future<UserModel> resendVerifyCode({
    required String? token,
  });

  Future<Unit> sendForgotPasswordCode({
    required String email,
    required String? lang,
  });

  Future<Unit> verifyForgotPasswordCode({
    required String email,
    required String code,
  });

  Future<UserModel> resetForgotPassword({
    required String email,
    required String code,
    required String pass,
    required String confirmPass,
  });

  Future<String?> changePassword({
    required String oldPass,
    required String pass,
    required String confirmPass,
    required String? token,
    required String? lang,
  });

  Future<QuickInfoModel> quickInfo({
    required String? token,
    required String? lang,
  });

  Future<String> updateProfile({
    required String name,
    required String mobile,
    required bool newsletter,
    required bool publicMessage,
    required bool supportSignLang,
    required String? token,
    required String? lang,
  });

  Future<String> updateProfileImg({
    required String image,
    required String? token,
    required String? lang,
  });

  Future<String> updateLocalization({
    required String countryId,
    required String provinceId,
    required String cityId,
    required String districtId,
    required String timezone,
    required String address,
    required String? token,
    required String? lang,
  });
}

class AuthRemoteDataSource extends GetConnect
    implements BaseAuthRemoteDataSource {
  @override
  Future<bool> getCountry() async {
    Get.log("getCountry==>${ApiUrls.getCountry}");
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.getCountry,
      headers: ApiUrls.getHeaders(),
    );
    Get.log("getCountry==>${response.body}");
    return await Handler.responeHandler(
      response,
      response.body?["data"] != null ? response.body['is_ksa'] : false,
    );
  }

  @override
  Future<UserModel> getUserData({
    required String? userId,
    required String? token,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.providerInfo(providerId: userId.toString()),
      headers: ApiUrls.getHeaders(
        token: token,
      ),
    );
    Get.log("getUserData==>${response.body}");
    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? UserModel.fromJson(
              response.body["data"]["user"],
              token,
            )
          : null,
    );
  }

  @override
  Future<String> updateProfile({
    required String name,
    required String mobile,
    required bool newsletter,
    required bool publicMessage,
    required bool supportSignLang,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await put(
      ApiUrls.updateProfile,
      {
        'full_name': name,
        'mobile': mobile,
        'newsletter': newsletter,
        'public_message': publicMessage,
        'support_sign_language': supportSignLang,
      },
      headers: ApiUrls.getHeaders(
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body["message"] ?? '',
    );
  }

  @override
  Future<String> updateProfileImg({
    required String image,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 2);

    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          ApiUrls.updateProfileImg,
        ));

    request.files.add(
      await http.MultipartFile.fromPath('profile_image', image),
    );

    request.headers.addAll(
      ApiUrls.getHeaders(
        token: token,
      ),
    );

    http.StreamedResponse response = await request.send();

    var result = jsonDecode(await response.stream.bytesToString());

    return result['message'];
  }

  @override
  Future<UserModel> login({
    required BaseAuthLocalDataSource baseAuthLocalDataSource,
    required String email,
    required String password,
    required String fcmToken,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await post(
      ApiUrls.login,
      {
        'email': email,
        'password': password,
        'fcm_token': fcmToken,
        'lang': lang,
      },
      headers: ApiUrls.getHeaders(
        lang: lang,
      ),
    );

    Get.log(response.bodyString?.toString() ?? 'null');
    if (response.statusCode == 403) {
      await baseAuthLocalDataSource.writeToken(token: response.body['token']);
      await baseAuthLocalDataSource.writeUserId(
          userId: response.body['id'].toString());
      throw UnVerifiedException(message: response.body['message']);
    } else if (response.body['status'] == 'incorrect' ||
        !response.body['success']) {
      throw ValidationException(message: response.body['message']);
    } else {
      Response userInfo = await get(
        ApiUrls.providerInfo(
            providerId: response.body['data']['user_id'].toString()),
        headers: ApiUrls.getHeaders(
          token: response.body['data']['token'],
          lang: lang,
        ),
      );
      Get.log(userInfo.bodyString?.toString() ?? 'null');
      return await Handler.responeHandler(
        response,
        response.body?["data"] != null
            ? UserModel.fromJson(
                userInfo.body["data"]["user"],
                response.body["data"]["token"],
              )
            : null,
      );
    }
  }

  @override
  Future<UserModel> register({
    required String name,
    required String countryCode,
    required String mobile,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String lang,
    required String fcmToken,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await post(
      ApiUrls.register,
      {
        "full_name": name,
        "country_code": countryCode,
        "mobile": mobile,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "device_token": fcmToken,
      },
      headers: ApiUrls.getHeaders(
        lang: lang,
      ),
    );
    Get.log(response.body.toString());
    return await Handler.responeHandler(
      response,
      response.body['success']
          ? UserModel.fromJson(
              response.body["data"]["user"],
              response.body["data"]["token"],
            )
          : null,
    );
  }

  @override
  Future<UserModel> verifyCode({
    required String userId,
    required String code,
    required String? token,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await post(
      ApiUrls.verifyCode,
      {
        'user_id': userId,
        'code': code,
      },
      headers: ApiUrls.getHeaders(
        token: token,
      ),
    );
    if (response.body != null &&
        (response.body['status'] == 'incorrect' || !response.body['success'])) {
      throw ValidationException(message: response.body['message']);
    }
    Get.log(response.bodyString.toString());
    Response userInfo = await get(
      ApiUrls.providerInfo(providerId: userId),
      headers: ApiUrls.getHeaders(
        token: token,
      ),
    );
    Get.log(userInfo.bodyString.toString());
    return await Handler.responeHandler(
      response,
      userInfo.body?["data"] != null
          ? UserModel.fromJson(
              userInfo.body["data"]["user"],
              token,
            )
          : null,
    );
  }

  @override
  Future<UserModel> resendVerifyCode({
    required String? token,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await post(
      ApiUrls.resendVerifyCode,
      {},
      headers: ApiUrls.getHeaders(
        token: token,
      ),
    );
    Get.log(response.bodyString.toString());
    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? UserModel.fromJson(
              response.body["data"],
              null,
            )
          : null,
    );
  }

  @override
  Future<Unit> verifyForgotPasswordCode({
    required String email,
    required String code,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await post(
      ApiUrls.verifyForgotPassCode,
      {
        'mobile_or_email': email,
        'code': code,
      },
      headers: ApiUrls.getHeaders(),
    );

    return await Handler.responeHandler(
      response,
      Future.value(unit),
    );
  }

  @override
  Future<UserModel> resetForgotPassword({
    required String email,
    required String code,
    required String pass,
    required String confirmPass,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await post(
      ApiUrls.resetForgotPass(token: ''),
      {
        'mobile_or_email': email,
        'code': code,
        'password': pass,
        'password_confirmation': confirmPass,
      },
      headers: ApiUrls.getHeaders(),
    );

    return await Handler.responeHandler(
      response,
      Future.value(response.body["message"]),
    );
  }

  @override
  Future<String?> changePassword({
    required String oldPass,
    required String pass,
    required String confirmPass,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await put(
      ApiUrls.changePassword,
      {
        'current_password': oldPass,
        'new_password': pass,
      },
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?['data'] != null ? response.body['data']['token'] : null,
    );
  }

  @override
  Future<Unit> sendForgotPasswordCode({
    required String email,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await post(
      ApiUrls.sendForgotPassCode,
      {
        'email': email,
      },
      headers: ApiUrls.getHeaders(
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      Future.value(unit),
    );
  }

  @override
  Future<Unit> logOut({
    required String? token,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await post(
      ApiUrls.logout,
      {},
      headers: ApiUrls.getHeaders(
        token: token,
      ),
    );
    Get.log(response.body.toString());
    return await Handler.responeHandler(
      response,
      Future.value(unit),
    );
  }

  @override
  Future<QuickInfoModel> quickInfo({
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.quickInfo,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body != null
          ? QuickInfoModel.fromJson(
              response.body,
            )
          : null,
    );
  }

  @override
  Future<String> updateLocalization({
    required String countryId,
    required String provinceId,
    required String cityId,
    required String districtId,
    required String timezone,
    required String address,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var body = {
      'country_id': countryId,
      'province_id': provinceId,
      'city_id': cityId,
      'district_id': districtId,
      'timezone': timezone,
      'address': address,
    };

    Response response = await put(
      ApiUrls.updateProfile,
      body,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body["message"] ?? '',
    );
  }
}
