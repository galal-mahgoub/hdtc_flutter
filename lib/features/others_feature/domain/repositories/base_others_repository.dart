import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../core/errors/failures.dart';
import '../entities/certificate.dart';
import '../entities/comments_respone.dart';
import '../entities/country.dart';
import '../entities/department.dart';
import '../entities/favorite.dart';
import '../entities/subscribe_respone.dart';
import '../entities/summery.dart';
import '../entities/ticket.dart';

abstract class BaseOthersRepository {
  Future<Either<Failure, List<Certificate>>> getCompletion();
  Future<Either<Failure, List<Certificate>>> getClassCertificates();
  Future<Either<Failure, List<Favorite>>> getFavourite();
  Future<Either<Failure, String>> deleteFavourite({
    required String favId,
  });

  Future<Either<Failure, CommentRespone>> getCommets();
  Future<Either<Failure, String>> editComment({
    required String commentId,
    required String comment,
  });
  Future<Either<Failure, String>> replyComment({
    required String commentId,
    required String reply,
  });
  Future<Either<Failure, String>> reportComment({
    required String commentId,
    required String message,
  });
  Future<Either<Failure, String>> deleteCommet({
    required String commentId,
  });

  Future<Either<Failure, SubscriptionRespone>> getSubscribes();
  Future<Either<Failure, Summery>> getSummarys();
  Future<Either<Failure, String>> checkoutSubscription({
    required String subscribeId,
  });

  Future<Either<Failure, List<Ticket>>> getTickets();
  Future<Either<Failure, List<Ticket>>> getMyClassSupports();
  Future<Either<Failure, List<Department>>> getDepartments();
  Future<Either<Failure, String>> sendTicket({
    required String departmentId,
    required String webinarId,
    required String title,
    required String type,
    required PlatformFile file,
    required String message,
  });

  Future<Either<Failure, String>> closeTicket({
    required String ticketId,
  });
  Future<Either<Failure, String>> replyTicket({
    required String ticketId,
    required String message,
    required PlatformFile file,
  });

  Future<Either<Failure, String>> downloadCertificate({ required String title,
    required String downloadLink,
  });

  Future<Either<Failure, List<String>>> getTimezones();

  Future<Either<Failure, List<Country>>> getCountries();
  Future<Either<Failure, List<Country>>> getProvinces({
    required String countryId,
  });
  Future<Either<Failure, List<Country>>> getCities({
    required String provinceId,
  });
  Future<Either<Failure, List<Country>>> getDistricts({
    required String cityId,
  });
 
}
