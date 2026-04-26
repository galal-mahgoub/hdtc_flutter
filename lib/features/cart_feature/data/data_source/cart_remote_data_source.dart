import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/consts/api_urls.dart';
import '../../../../core/network/handler.dart';
import '../models/cart_model.dart';

abstract class BaseCartRemoteDataSource {
  Future<CartModel?> getCartList({
    required String? token,
    required String? lang,
  });

  Future<Unit> deleteCartItem({
    required String itemId,
    required String? token,
    required String? lang,
  });

  Future<CartModel> checkCoupon({
    required String coupon,
    required String? token,
    required String? lang,
  });

  Future<String> checkOut({
    required String? couponId,
    required String? token,
    required String? lang,
  });
}

class CartRemoteDataSource extends GetConnect
    implements BaseCartRemoteDataSource {
  @override
  Future<CartModel?> getCartList({
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.cartList,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );
    Get.log("getCartList==>${response.bodyString}");
    return await Handler.responeHandler(
      response,
      response.body is Map && (response.body as Map).containsKey("data")
          ? response.body["data"]["cart"] == null
              ? null
              : CartModel.fromJson(
                  response.body["data"]["cart"],
                )
          : null,
    );
  }

  @override
  Future<Unit> deleteCartItem({
    required String itemId,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await delete(
      ApiUrls.deletecartItem + itemId,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      unit,
    );
  }

  @override
  Future<CartModel> checkCoupon({
    required String coupon,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var data = {"coupon": coupon};

    Response response = await post(
      ApiUrls.checkCoupon,
      data,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );
    
    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? CartModel.fromJson(
              response.body["data"],
            )
          : null,
    );
  }

  @override
  Future<String> checkOut({
    required String? couponId,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var data = {"discount_id": couponId};

    Response response = await post(
      ApiUrls.checkout,
      data,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null ? response.body["data"]["link"] : null,
    );
  }
}
