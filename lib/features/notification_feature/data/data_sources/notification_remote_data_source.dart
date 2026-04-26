import 'package:get/get.dart';

import '../../../../../core/consts/api_urls.dart';
import '../../../../../core/network/handler.dart';
import '../models/notification_model.dart';

abstract class BaseNotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications({
    required String? limit,
    required String? offset,
    required String? token,
    required String? lang,
  });
}

class NotificationRemoteDataSource extends GetConnect
    implements BaseNotificationRemoteDataSource {
  @override
  Future<List<NotificationModel>> getNotifications({
    required String? limit,
    required String? offset,
    required String? token,
    required String? lang,
  }) async {httpClient.timeout = const Duration(hours: 1);
    var queryParameters = {
      'limit': limit,
      'offset': offset,
    };
    Response response = await get(
      ApiUrls.allNotifications,
      query: queryParameters,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );
    Get.log("getNotifications==>${response.bodyString}");
    return await Handler.responeHandler(
      response,
      response.body?["data"]["notifications"] != null
          ? List.from(response.body['data']['notifications'])
              .map((e) => NotificationModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }
}
