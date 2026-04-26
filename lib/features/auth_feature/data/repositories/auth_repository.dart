import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/handler.dart';
import '../../domain/repositories/base_auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';
import '../models/quick_info_model.dart';
import '../models/user_model.dart';

class AuthRespoitory implements BaseAuthRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;
  final FirebaseMessaging firebaseMessaging;
  final Handler handler;
  AuthRespoitory({
    required this.baseAuthRemoteDataSource,
    required this.firebaseMessaging,
    required this.handler,
  });

  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    return handler.asyncHandler<UserModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      var lang = await baseLanguageLocalDataSource.readLanguage();
      var token = await baseAuthLocalDataSource.readToken();
      var fcmToken = await firebaseMessaging.getToken();

      final user = await baseAuthRemoteDataSource.login(
        email: email,
        password: password,
        lang: lang,
        fcmToken: fcmToken ?? '',
        token: token,
        baseAuthLocalDataSource: baseAuthLocalDataSource,
      );

      await baseAuthLocalDataSource.writeUser(user: user);
      await baseAuthLocalDataSource.writeToken(token: user.token!);
      await baseAuthLocalDataSource.writeUserId(userId: user.id.toString());

      return user;
    });
  }

  @override
  Future<Either<Failure, UserModel>> register({
    required String name,
    required String countryCode,
    required String mobile,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    return handler.asyncHandler<UserModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      var lang = await baseLanguageLocalDataSource.readLanguage();
      var fcmToken = await firebaseMessaging.getToken();

      final user = await baseAuthRemoteDataSource.register(
        password: password,
        passwordConfirmation: passwordConfirmation,
        email: email,
        mobile: mobile,
        countryCode: countryCode,
        name: name,
        lang: lang,
        fcmToken: fcmToken ?? '',
      );

      await baseAuthLocalDataSource.writeUser(user: user);
      if (user.token != null) {
        await baseAuthLocalDataSource.writeToken(token: user.token!);
      }
      if (user.id != null) {
        await baseAuthLocalDataSource.writeUserId(userId: user.id.toString());
      }

      return user;
    });
  }

  @override
  Future<Either<Failure, UserModel>> verifyCode({
    required String code,
  }) async {
    return handler.asyncHandler<UserModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? userId = await baseAuthLocalDataSource.readUserId();

      var user = await baseAuthRemoteDataSource.verifyCode(
        userId: userId ?? '`',
        code: code,
        token: token,
      );
      await baseAuthLocalDataSource.writeUser(user: user);
      if (user.token != null) {
        await baseAuthLocalDataSource.writeToken(token: user.token!);
      }
      if (user.id != null) {
        await baseAuthLocalDataSource.writeUserId(userId: user.id.toString());
      }

      return user;
    });
  }

  @override
  Future<Either<Failure, Unit>> resendVerifyCode() async {
    return handler.asyncHandler<Unit>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();

      var user = await baseAuthRemoteDataSource.resendVerifyCode(
        token: token,
      );

      await baseAuthLocalDataSource.writeUser(user: user);
      if (user.token != null) {
        await baseAuthLocalDataSource.writeToken(token: user.token!);
      }
      if (user.id != null) {
        await baseAuthLocalDataSource.writeUserId(userId: user.id.toString());
      }

      return Future.value(unit);
    });
  }

  @override
  Future<Either<Failure, String>> updateProfile({
    required String name,
    required String mobile,
    required bool newsletter,
    required bool publicMessage,
    required bool supportSignLang,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      var data = await baseAuthRemoteDataSource.updateProfile(
        name: name,
        mobile: mobile,
        newsletter: newsletter,
        publicMessage: publicMessage,
        supportSignLang: supportSignLang,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> updateProfileImg({
    required String image,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      var data = await baseAuthRemoteDataSource.updateProfileImg(
        image: image,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, Unit>> changePassword({
    required String oldPass,
    required String pass,
    required String confirmPass,
  }) async {
    return handler.asyncHandler<Unit>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      String? newToken = await baseAuthRemoteDataSource.changePassword(
        oldPass: oldPass,
        pass: pass,
        confirmPass: confirmPass,
        token: token,
        lang: lang,
      );
      if (newToken != null) {
        await baseAuthLocalDataSource.writeToken(token: newToken);
      }

      return unit;
    });
  }

  @override
  Future<Either<Failure, UserModel>> getUserData() async {
    return handler.asyncHandler<UserModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? userId = await baseAuthLocalDataSource.readUserId();

      var user = await baseAuthRemoteDataSource.getUserData(
        userId: userId,
        token: token,
      );

      await baseAuthLocalDataSource.writeUser(user: user);
      if (user.token != null) {
        await baseAuthLocalDataSource.writeToken(token: user.token!);
      }
      if (user.id != null) {
        await baseAuthLocalDataSource.writeUserId(userId: user.id.toString());
      }

      return user;
    });
  }

  @override
  Future<Either<Failure, bool>> getCountry() async {
    return handler.asyncHandler<bool>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      var data = await baseAuthRemoteDataSource.getCountry();

      return data;
    });
  }

  @override
  Future<Either<Failure, Unit>> logOut() async {
    return handler.asyncHandler<Unit>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();

      await baseAuthRemoteDataSource.logOut(
        token: token,
      );

      await baseAuthLocalDataSource.removeUserId();
      await baseAuthLocalDataSource.removeToken();
      await baseAuthLocalDataSource.removeUser();

      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> sendForgotPasswordCode({
    required String email,
  }) async {
    return handler.asyncHandler<Unit>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      var lang = await baseLanguageLocalDataSource.readLanguage();

      await baseAuthRemoteDataSource.sendForgotPasswordCode(
        email: email,
        lang: lang,
      );

      return unit;
    });
  }

  @override
  Future<Either<Failure, Unit>> verifyForgotPasswordCode({
    required String email,
    required String code,
  }) async {
    return handler.asyncHandler<Unit>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      await baseAuthRemoteDataSource.verifyForgotPasswordCode(
        email: email,
        code: code,
      );

      return unit;
    });
  }

  @override
  Future<Either<Failure, UserModel>> resetForgotPassword({
    required String email,
    required String code,
    required String pass,
    required String confirmPass,
  }) async {
    return handler.asyncHandler<UserModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      final user = await baseAuthRemoteDataSource.resetForgotPassword(
        email: email,
        code: code,
        pass: pass,
        confirmPass: confirmPass,
      );

      return user;
    });
  }

  @override
  Future<Either<Failure, QuickInfoModel>> quickInfo() async {
    return handler.asyncHandler<QuickInfoModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final user = await baseAuthRemoteDataSource.quickInfo(
        token: token,
        lang: lang,
      );

      return user;
    });
  }

  @override
  Future<Either<Failure, String>> updateLocalization({
    required String countryId,
    required String provinceId,
    required String cityId,
    required String districtId,
    required String timezone,
    required String address,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final user = await baseAuthRemoteDataSource.updateLocalization(
        countryId: countryId,
        provinceId: provinceId,
        cityId: cityId,
        districtId: districtId,
        timezone: timezone,
        address: address,
        token: token,
        lang: lang,
      );

      return user;
    });
  }
}
