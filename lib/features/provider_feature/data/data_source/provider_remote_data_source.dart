import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../core/consts/api_urls.dart';
import '../../../../core/network/handler.dart';
import '../models/provider_model.dart';
import '../models/reservation_model.dart' as reservation;
import '../models/time_model.dart';

abstract class BaseProviderRemoteDataSource {
  Future<List<ProviderModel>> instructors({
    required String? sort,
    required List<String> categories,
    required String? token,
    required String? lang,
  });

  Future<List<ProviderModel>> businessConsultations({
    required int availableMeetings,
    required int freeMeetings,
    required int discount,
    required int downloadable,
    required String sort,
    required String? token,
    required String? lang,
  });

  Future<ProviderModel> getProviderInfo({
    required int providerId,
    required String? token,
    required String? lang,
  });

  Future<Unit> followProvider({
    required int providerId,
    required bool status,
    required String? token,
    required String? lang,
  });

  Future<List<TimeModel>> getConsultantMeetingsDate({
    required int providerId,
    required String date,
    required String? token,
    required String? lang,
  });

  Future<Unit> createMeeting({
    required String timeId,
    required String date,
    required String meetingType,
    required String description,
    required String? token,
    required String? lang,
  });

  Future<reservation.ReservationModel> getMeetings({
    required String? token,
    required String? lang,
  });

  Future<String> finishMeeting({
    required String meetingId,
    required String? token,
    required String? lang,
  });

  Future<String> createMeetingLink({
    required String meetingId,
    required String link,
    required String? pass,
    required String? token,
    required String? lang,
  });
}

class ProviderRemoteDataSource extends GetConnect
    implements BaseProviderRemoteDataSource {
  @override
  Future<List<ProviderModel>> instructors({
    required String? sort,
    required List<String> categories,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var queryParameters = {
      'sort': sort,
      'categories': categories,
    };
    Response response = await get(
      ApiUrls.instructors,
      query: queryParameters,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );
    Get.log("instructors==>${response.body}");
    return await Handler.responeHandler<List<ProviderModel>?>(
      response,
      response.body?["data"] != null
          ? List.from(response.body['data']['users'])
              .map((e) => ProviderModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }

  @override
  Future<List<ProviderModel>> businessConsultations({
    required int availableMeetings,
    required int freeMeetings,
    required int discount,
    required int downloadable,
    required String sort,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var queryParameters = {
      'available_for_meetings': availableMeetings.toString(),
      'free_meetings': freeMeetings.toString(),
      'discount': discount.toString(),
      'downloadable': downloadable.toString(),
      'sort': sort.toString(),
    };
    Response response = await get(
      ApiUrls.businessConsultations,
      query: queryParameters,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler<List<ProviderModel>?>(
      response,
      response.body?["data"] != null
          ? List.from(response.body['data']['users'])
              .map((e) => ProviderModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }

  @override
  Future<ProviderModel> getProviderInfo({
    required int providerId,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.providerInfo(
        providerId: providerId.toString(),
      ),
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );
    Get.log(response.bodyString ?? '');
    return await Handler.responeHandler<ProviderModel?>(
      response,
      response.body?["data"] != null
          ? ProviderModel.fromJson(response.body['data']['user'])
          : null,
    );
  }

  @override
  Future<Unit> followProvider({
    required int providerId,
    required bool status,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await post(
      ApiUrls.followProvider(
        providerId: providerId,
      ),
      {
        'status': status ? 1 : 0,
      },
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler<Unit>(
      response,
      unit,
    );
  }

  @override
  Future<List<TimeModel>> getConsultantMeetingsDate({
    required int providerId,
    required String date,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var queryParameters = {
      'date': date,
    };
    Response response = await get(
      ApiUrls.consultantMeetingsDate(
        providerId: providerId,
      ),
      query: queryParameters,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler<List<TimeModel>>(
      response,
      response.body?["data"] != null
          ? List.from(response.body['data']['times'])
              .map((e) => TimeModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }

  @override
  Future<Unit> createMeeting({
    required String timeId,
    required String date,
    required String meetingType,
    required String description,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var data = {
      'time_id': timeId,
      'date': date,
      'meeting_type': meetingType,
      'description': description,
    };
    Response response = await post(
      ApiUrls.createMeeting,
      data,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler<Unit>(
      response,
      unit,
    );
  }

  @override
  Future<reservation.ReservationModel> getMeetings({
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.meetings,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? reservation.ReservationModel.fromJson(
              response.body?["data"],
            )
          : null,
    );
  }

  @override
  Future<String> finishMeeting({
    required String meetingId,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await post(
      ApiUrls.finishMeetings(
        meetingId: meetingId,
      ),
      {},
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body['message'],
    );
  }

  @override
  Future<String> createMeetingLink({
    required String meetingId,
    required String link,
    required String? pass,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var data = {
      'link': link,
      'reserved_meeting_id': meetingId,
      'password': pass,
    };
    data.removeWhere((key, value) => value == null);

    Response response = await post(
      ApiUrls.createMeetingLink,
      data,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body['message'],
    );
  }
}
