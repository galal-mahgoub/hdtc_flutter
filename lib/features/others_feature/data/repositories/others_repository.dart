import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/handler.dart';
import '../../domain/repositories/base_others_repository.dart';
import '../data_sources/others_remote_data_source.dart';
import '../models/certificates_model.dart';
import '../models/comments_respone_model.dart';
import '../models/country_model.dart';
import '../models/department_model.dart';
import '../models/favorite_model.dart';
import '../models/subscribe_respone_model.dart';
import '../models/summery_model.dart';
import '../models/ticket_model.dart';

class OthersRespoitory implements BaseOthersRepository {
  final BaseOthersRemoteDataSource baseOthersRemoteDataSource;
  final FirebaseMessaging firebaseMessaging;
  final Handler handler;

  OthersRespoitory({
    required this.baseOthersRemoteDataSource,
    required this.firebaseMessaging,
    required this.handler,
  });

  @override
  Future<Either<Failure, List<CertificateModel>>> getCompletion() async {
    return handler.asyncHandler<List<CertificateModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.getCompletion(
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<CertificateModel>>> getClassCertificates() async {
    return handler.asyncHandler<List<CertificateModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.getClassCertificates(
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<FavoriteModel>>> getFavourite() async {
    return handler.asyncHandler<List<FavoriteModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.getFavourite(
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> deleteFavourite({
    required String favId,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.deleteFavourite(
        favId: favId,
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, CommentResponeModel>> getCommets() async {
    return handler.asyncHandler<CommentResponeModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.getCommets(
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> editComment({
    required String commentId,
    required String comment,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.editComment(
        commentId: commentId,
        comment: comment,
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> replyComment({
    required String commentId,
    required String reply,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.replyComment(
        commentId: commentId,
        reply: reply,
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> reportComment({
    required String commentId,
    required String message,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.reportComment(
        commentId: commentId,
        message: message,
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> deleteCommet({
    required String commentId,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.deleteCommet(
        commentId: commentId,
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, SubscriptionResponeModel>> getSubscribes() async {
    return handler.asyncHandler<SubscriptionResponeModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.getSubscribes(
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, SummeryModel>> getSummarys() async {
    return handler.asyncHandler<SummeryModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.getSummarys(
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> checkoutSubscription({
    required String subscribeId,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.checkoutSubscription(
        subscribeId: subscribeId,
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<TicketModel>>> getTickets() async {
    return handler.asyncHandler<List<TicketModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.getTickets(
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<TicketModel>>> getMyClassSupports() async {
    return handler.asyncHandler<List<TicketModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.getMyClassSupports(
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<DepartmentModel>>> getDepartments() async {
    return handler.asyncHandler<List<DepartmentModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.getDepartments(
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> sendTicket({
    required String departmentId,
    required String webinarId,
    required String title,
    required String type,
    required PlatformFile file,
    required String message,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.sendTicket(
        departmentId: departmentId,
        webinarId: webinarId,
        title: title,
        type: type,
        file: file,
        message: message,
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> closeTicket({
    required String ticketId,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.closeTicket(
        ticketId: ticketId,
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> replyTicket({
    required String ticketId,
    required String message,
    required PlatformFile file,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.replyTicket(
        ticketId: ticketId,
        message: message,
        file: file,
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> downloadCertificate({
    required String downloadLink,
    required String title,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.downloadCertificate(
        downloadLink: downloadLink,
        title: title,
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<String>>> getTimezones() async {
    return handler.asyncHandler<List<String>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.getTimezones(
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<CountryModel>>> getCountries() async {
    return handler.asyncHandler<List<CountryModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.getCountries(
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<CountryModel>>> getProvinces({
    required String countryId,
  }) async {
    return handler.asyncHandler<List<CountryModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.getProvinces(
        countryId: countryId,
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<CountryModel>>> getCities({
    required String provinceId,
  }) async {
    return handler.asyncHandler<List<CountryModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.getCities(
        provinceId: provinceId,
        lang: lang,
        token: token,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<CountryModel>>> getDistricts({
    required String cityId,
  }) async {
    return handler.asyncHandler<List<CountryModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseOthersRemoteDataSource.getDistricts(
        cityId: cityId,
        lang: lang,
        token: token,
      );

      return data;
    });
  }

 
}
