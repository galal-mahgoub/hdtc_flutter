import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/consts/k_strings.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/languages/app_translations.dart';
import '../models/user_model.dart';

abstract class BaseAuthLocalDataSource {
  Future<UserModel> readUser();
  Future<Unit> writeUser({required UserModel user});
  Future<Unit> removeUser();

  Future<String?> readToken();
  Future<Unit> writeToken({required String token});
  Future<Unit> removeToken();

  Future<String?> readUserId();
  Future<Unit> writeUserId({required String userId});
  Future<Unit> removeUserId();
}

class AuthLocalDataSource implements BaseAuthLocalDataSource {
  final GetStorage getStorage;
  final FlutterSecureStorage flutterSecureStorage;

  AuthLocalDataSource({
    required this.getStorage,
    required this.flutterSecureStorage,
  });

  ///-------------- USER DATA ------------------------------------------------
  @override
  Future<UserModel> readUser() async {
    try {
      final data = await getStorage.read(Kstrings.userStorage);

      return Future.value(UserModel.fromJson(data, null));
    } catch (e) {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> writeUser({required UserModel user}) async {
    try {
      await getStorage.write(Kstrings.userStorage, user.toJson());

      return Future.value(unit);
    } catch (e) {
    
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> removeUser() async {
    try {
      await getStorage.remove(Kstrings.userStorage);

      return Future.value(unit);
    } catch (e) {
      throw EmptyCacheException();
    }
  }

  ///-------------- USER TOKEN -------------------------------------------------
  @override
  Future<String?> readToken() async {
    try {
      String? token =
          await flutterSecureStorage.read(key: Kstrings.userTokenStorage);

      return Future.value(token);
    } catch (e) {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> writeToken({required String token}) async {
    try {
      await flutterSecureStorage.write(
          key: Kstrings.userTokenStorage, value: token);

      return Future.value(unit);
    } catch (e) {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> removeToken() async {
    try {
      await flutterSecureStorage.delete(key: Kstrings.userTokenStorage);

      return Future.value(unit);
    } catch (e) {
      throw UnAuthenticatedException(message: LocaleKeys.unAuthMessage.tr);
    }
  }

  ///-------------- USER ID -------------------------------------------------
  @override
  Future<String?> readUserId() async {
    try {
      String? userId =
          await flutterSecureStorage.read(key: Kstrings.userIdStorage);

      return Future.value(userId);
    } catch (e) {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> writeUserId({required String userId}) async {
    try {
      await flutterSecureStorage.write(
          key: Kstrings.userIdStorage, value: userId);

      return Future.value(unit);
    } catch (e) {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> removeUserId() async {
    try {
      await flutterSecureStorage.delete(key: Kstrings.userIdStorage);

      return Future.value(unit);
    } catch (e) {
      throw UnAuthenticatedException(message: LocaleKeys.unAuthMessage.tr);
    }
  }
}
