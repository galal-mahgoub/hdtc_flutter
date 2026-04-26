import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/handler.dart';
import '../../domain/repositories/base_cart_repository.dart';
import '../data_source/cart_remote_data_source.dart';
import '../models/cart_model.dart';

class CartRespoitory implements BaseCartRepository {
  final BaseCartRemoteDataSource baseCartRemoteDataSource;
  final FirebaseMessaging firebaseMessaging;
  final Handler handler;
  CartRespoitory({
    required this.baseCartRemoteDataSource,
    required this.firebaseMessaging,
    required this.handler,
  });

  @override
  Future<Either<Failure, CartModel?>> getCartList() async {
    return handler.asyncHandler<CartModel?>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCartRemoteDataSource.getCartList(
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteCartItem({
    required String itemId,
  }) async {
    return handler.asyncHandler<Unit>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCartRemoteDataSource.deleteCartItem(
        itemId: itemId,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, CartModel?>> checkCoupon({
    required String coupon,
  }) async {
    return handler.asyncHandler<CartModel?>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCartRemoteDataSource.checkCoupon(
        coupon: coupon,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> checkOut({
    required String? couponId,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCartRemoteDataSource.checkOut(
        couponId: couponId,
        token: token,
        lang: lang,
      );

      return data;
    });
  }
}
