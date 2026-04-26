import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../core/consts/api_urls.dart';
import '../../../../../core/network/handler.dart';
import '../models/certificates_model.dart';
import '../models/comments_respone_model.dart';
import '../models/country_model.dart';
import '../models/department_model.dart';
import '../models/favorite_model.dart';
import '../models/subscribe_respone_model.dart';
import '../models/summery_model.dart';
import '../models/ticket_model.dart';
import 'package:http/http.dart' as http;

abstract class BaseOthersRemoteDataSource {
  Future<List<CertificateModel>> getCompletion({
    required String? lang,
    required String? token,
  });

  Future<List<CertificateModel>> getClassCertificates({
    required String? lang,
    required String? token,
  });

  Future<List<FavoriteModel>> getFavourite({
    required String? lang,
    required String? token,
  });

  Future<String> deleteFavourite({
    required String favId,
    required String? lang,
    required String? token,
  });

  Future<CommentResponeModel> getCommets({
    required String? lang,
    required String? token,
  });

  Future<String> editComment({
    required String commentId,
    required String comment,
    required String? lang,
    required String? token,
  });

  Future<String> deleteCommet({
    required String commentId,
    required String? lang,
    required String? token,
  });

  Future<String> replyComment({
    required String commentId,
    required String reply,
    required String? lang,
    required String? token,
  });
  Future<String> reportComment({
    required String commentId,
    required String message,
    required String? lang,
    required String? token,
  });

  Future<SubscriptionResponeModel> getSubscribes({
    required String? lang,
    required String? token,
  });
  Future<SummeryModel> getSummarys({
    required String? lang,
    required String? token,
  });
  Future<String> checkoutSubscription({
    required String subscribeId,
    required String? lang,
    required String? token,
  });

  Future<List<TicketModel>> getTickets({
    required String? lang,
    required String? token,
  });

  Future<List<TicketModel>> getMyClassSupports({
    required String? lang,
    required String? token,
  });
  Future<List<DepartmentModel>> getDepartments({
    required String? lang,
    required String? token,
  });
  Future<String> sendTicket({
    required String departmentId,
    required String webinarId,
    required String title,
    required String type,
    required PlatformFile file,
    required String message,
    required String? lang,
    required String? token,
  });

  Future<String> closeTicket({
    required String ticketId,
    required String? lang,
    required String? token,
  });
  Future<String> replyTicket({
    required String ticketId,
    required String message,
    required PlatformFile file,
    required String? lang,
    required String? token,
  });

  Future<String> downloadCertificate({
    required String downloadLink,
    required String title,
    required String? lang,
    required String? token,
  });
  Future<List<String>> getTimezones({
    required String? lang,
    required String? token,
  });
  Future<List<CountryModel>> getCountries({
    required String? lang,
    required String? token,
  });
  Future<List<CountryModel>> getProvinces({
    required String countryId,
    required String? lang,
    required String? token,
  });
  Future<List<CountryModel>> getCities({
    required String provinceId,
    required String? lang,
    required String? token,
  });
  Future<List<CountryModel>> getDistricts({
    required String cityId,
    required String? lang,
    required String? token,
  });
}

class OthersRemoteDataSource extends GetConnect
    implements BaseOthersRemoteDataSource {
  @override
  Future<List<CertificateModel>> getCompletion({
    required String? lang,
    required String? token,
  }) async {
    Response response = await get(
      ApiUrls.certificates,
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"]["certificates"] != null
          ? List.from(response.body['data']['certificates'])
              .map((e) => CertificateModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }

  @override
  Future<List<CertificateModel>> getClassCertificates({
    required String? lang,
    required String? token,
  }) async {
    Response response = await get(
      ApiUrls.classCertificates,
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"]["certificates"] != null
          ? List.from(response.body['data']['certificates'])
              .map((e) => CertificateModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }

  @override
  Future<List<FavoriteModel>> getFavourite({
    required String? lang,
    required String? token,
  }) async {
    Response response = await get(
      ApiUrls.favorites,
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"]["favorites"] != null
          ? List.from(response.body['data']['favorites'])
              .map((e) => FavoriteModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }

  @override
  Future<String> deleteFavourite({
    required String favId,
    required String? lang,
    required String? token,
  }) async {
    Response response = await delete(
      '${ApiUrls.favorites}/$favId',
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body["message"] ?? '',
    );
  }

  @override
  Future<CommentResponeModel> getCommets({
    required String? lang,
    required String? token,
  }) async {
    httpClient.timeout = const Duration(minutes: 2);
    Response response = await get(
      ApiUrls.comments,
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? CommentResponeModel.fromJson(response.body['data'])
          : null,
    );
  }

  @override
  Future<String> editComment({
    required String commentId,
    required String comment,
    required String? lang,
    required String? token,
  }) async {
    var queryParameters = {
      'comment': comment,
    };
    Response response = await put(
      '${ApiUrls.comments}/$commentId',
      queryParameters,
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body["message"] ?? '',
    );
  }

  @override
  Future<String> replyComment({
    required String commentId,
    required String reply,
    required String? lang,
    required String? token,
  }) async {
    var queryParameters = {
      'reply': reply,
    };
    Response response = await post(
      '${ApiUrls.comments}/$commentId/reply',
      queryParameters,
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body["message"] ?? '',
    );
  }

  @override
  Future<String> reportComment({
    required String commentId,
    required String message,
    required String? lang,
    required String? token,
  }) async {
    var queryParameters = {
      'message': message,
    };
    Response response = await post(
      '${ApiUrls.comments}/$commentId/report',
      queryParameters,
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body["message"] ?? '',
    );
  }

  @override
  Future<String> deleteCommet({
    required String commentId,
    required String? lang,
    required String? token,
  }) async {
    Response response = await delete(
      '${ApiUrls.comments}/$commentId',
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["message"] ?? '',
    );
  }

  @override
  Future<SubscriptionResponeModel> getSubscribes({
    required String? lang,
    required String? token,
  }) async {
    Response response = await get(
      ApiUrls.subscribes,
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );
 
    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? SubscriptionResponeModel.fromJson(response.body['data'])
          : null,
    );
  }

  @override
  Future<SummeryModel> getSummarys({
    required String? lang,
    required String? token,
  }) async {
    Response response = await get(
      ApiUrls.summerys,
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? SummeryModel.fromJson(response.body['data'])
          : null,
    );
  }

  @override
  Future<String> checkoutSubscription({
    required String subscribeId,
    required String? lang,
    required String? token,
  }) async {
    var data = {"subscribe_id": subscribeId};
    Response response = await post(
      ApiUrls.checkSubscribes,
      data,
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"]['link'] != null
          ? response.body['data']['link']
          : null,
    );
  }

  @override
  Future<List<TicketModel>> getTickets({
    required String? lang,
    required String? token,
  }) async {
    Response response = await get(
      ApiUrls.tickets,
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? List.from(response.body['data'])
              .map((e) => TicketModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }

  @override
  Future<List<TicketModel>> getMyClassSupports({
    required String? lang,
    required String? token,
  }) async {
    Response response = await get(
      ApiUrls.myClassTickets,
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? List.from(response.body['data'])
              .map((e) => TicketModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }

  @override
  Future<List<DepartmentModel>> getDepartments({
    required String? lang,
    required String? token,
  }) async {
    Response response = await get(
      ApiUrls.departments,
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body != null
          ? List.from(response.body)
              .map((e) => DepartmentModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }

  @override
  Future<String> sendTicket({
    required String departmentId,
    required String webinarId,
    required String title,
    required String type,
    required PlatformFile file,
    required String message,
    required String? lang,
    required String? token,
  }) async {
    httpClient.timeout = const Duration(hours: 2);

    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '${ApiUrls.sendTicket}?title=$title&type=$type&department_id=$departmentId&webinar_id=$webinarId&message=$message',
        ));
    if (file.path != null) {
      request.files.add(
        await http.MultipartFile.fromPath('attach', file.path!),
      );
    }

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
  Future<String> closeTicket({
    required String ticketId,
    required String? lang,
    required String? token,
  }) async {
    Response response = await get(
      ApiUrls.closeTicket(ticketId: ticketId),
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["message"] ?? '',
    );
  }

  @override
  Future<String> replyTicket({
    required String ticketId,
    required String message,
    required PlatformFile file,
    required String? lang,
    required String? token,
  }) async {
    httpClient.timeout = const Duration(hours: 2);

    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '${ApiUrls.replyTicket(
            ticketId: ticketId,
          )}?message=$message',
        ));

    if (file.path != null) {
      request.files.add(
        await http.MultipartFile.fromPath('attachment', file.path!),
      );
    }

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
  Future<String> downloadCertificate({
    required String downloadLink,
    required String title,
    required String? lang,
    required String? token,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    bool dirDownloadExists = true;
    Directory? directory;
    if (Platform.isIOS) {
      directory = await getDownloadsDirectory();
    } else {
      dirDownloadExists =
          await Directory("/storage/emulated/0/Download/").exists();
      if (dirDownloadExists) {
        directory = Directory("/storage/emulated/0/Download/");
      } else {
        directory = Directory("/storage/emulated/0/Downloads/");
      }
    }
// wait dio.Dio().download(
//       downloadLink,
//       '${directory!.path}/certificate $title.png',
//       options: dio.Options(responseType: dio.ResponseType.bytes),
//     );

    return await dio.Dio()
        .downloadUri(Uri.parse(downloadLink),
            '${directory!.path}/certificate $title.png',
            options: dio.Options(
                headers: {'Authorization': 'Bearer $token'},
                receiveTimeout: 3000,
                sendTimeout: 5000,
                responseType: dio.ResponseType.bytes))
        .then((value) {
      if (value.statusCode == 200) {
        return 'download successfully';
      } else {
        throw Exception('Server Failure Message');
      }
    });
  }

  @override
  Future<List<String>> getTimezones({
    required String? lang,
    required String? token,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.timezones,
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? List.from(response.body["data"]).map((e) => e.toString()).toList()
          : [],
    );
  }

  @override
  Future<List<CountryModel>> getCountries({
    required String? lang,
    required String? token,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.countries,
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? List.from(response.body["data"])
              .map(
                (e) => CountryModel.fromJson(e),
              )
              .toList()
          : [],
    );
  }

  @override
  Future<List<CountryModel>> getProvinces({
    required String countryId,
    required String? lang,
    required String? token,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.getProvinces(countryId: countryId),
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? List.from(response.body["data"])
              .map(
                (e) => CountryModel.fromJson(e),
              )
              .toList()
          : [],
    );
  }

  @override
  Future<List<CountryModel>> getCities({
    required String provinceId,
    required String? lang,
    required String? token,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.getCities(provinceId: provinceId),
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? List.from(response.body["data"])
              .map(
                (e) => CountryModel.fromJson(e),
              )
              .toList()
          : [],
    );
  }

  @override
  Future<List<CountryModel>> getDistricts({
    required String cityId,
    required String? lang,
    required String? token,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.getDistricts(cityId: cityId),
      headers: ApiUrls.getHeaders(
        lang: lang,
        token: token,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? List.from(response.body["data"])
              .map(
                (e) => CountryModel.fromJson(e),
              )
              .toList()
          : [],
    );
  }
}
