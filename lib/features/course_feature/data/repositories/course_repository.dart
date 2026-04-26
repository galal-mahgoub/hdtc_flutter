import 'package:dartz/dartz.dart';
import 'package:hdtc_on/features/course_feature/data/data_source/course_local_data_source.dart';
import 'package:hdtc_on/features/course_feature/data/models/course_model.dart';
import 'package:hdtc_on/features/course_feature/domain/entities/download.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/handler.dart';
import '../../domain/entities/question_store.dart';
import '../../domain/repositories/base_course_repository.dart';
import '../data_source/course_remote_data_source.dart';
import '../models/content_model.dart';
import '../models/download_model.dart';
import '../models/forum_data_model.dart';
import '../models/notice_model.dart';
import '../models/result.dart';
import '../models/start_quiz_model.dart';

class CourseRespoitory implements BaseCourseRepository {
  final BaseCourseRemoteDataSource baseCourseRemoteDataSource;
  final BaseCourseLocalDataSource baseCourseLocalDataSource;
  final FirebaseMessaging firebaseMessaging;
  final Handler handler;

  CourseRespoitory({
    required this.baseCourseRemoteDataSource,
    required this.baseCourseLocalDataSource,
    required this.firebaseMessaging,
    required this.handler,
  });

  @override
  Future<Either<Failure, List<CourseModel>>> featuredCourses(
      {String? categoryId}) async {
    return handler.asyncHandler<List<CourseModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.featuredCourses(
        categoryId: categoryId,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<CourseModel>>> myCourses() async {
    return handler.asyncHandler<List<CourseModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.myCourses(
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<CourseModel>>> courses({
    required String? sort,
    required String? offset,
    required String? limit,
    required bool? isFree,
    String? categoryId,
    Map<String, Object>? query,
  }) async {
    return handler.asyncHandler<List<CourseModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final courses = await baseCourseRemoteDataSource.courses(
        sort: sort,
        offset: offset,
        limit: limit,
        isFree: isFree,
        categoryId: categoryId,
        query: query,
        token: token,
        lang: lang,
      );

      return courses;
    });
  }

  @override
  Future<Either<Failure, List<CourseModel>>> searchCourses({
    required String? search,
    required String? offset,
    required String? limit,
  }) async {
    return handler.asyncHandler<List<CourseModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final courses = await baseCourseRemoteDataSource.searchCourses(
        search: search,
        offset: offset,
        limit: limit,
        token: token,
        lang: lang,
      );

      return courses;
    });
  }

  @override
  Future<Either<Failure, CourseModel>> courseDetails({
    required String courseId,
  }) async {
    return handler.asyncHandler<CourseModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.courseDetails(
        courseId: courseId,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, Unit>> addFavourite({
    required String courseId,
  }) async {
    return handler.asyncHandler<Unit>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.addFavourite(
        courseId: courseId,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<String>>> getReasons() async {
    return handler.asyncHandler<List<String>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.getReasons(
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> addReport({
    required String courseId,
    required String reason,
    required String message,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.addReport(
        courseId: courseId,
        reason: reason,
        message: message,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<ContentModel>>> getCourseContent({
    required String courseId,
  }) async {
    return handler.asyncHandler<List<ContentModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.getCourseContent(
        courseId: courseId,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> sendCourseComment({
    required String courseId,
    required String comment,
    required String itemName,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.sendCourseComment(
        courseId: courseId,
        comment: comment,
        itemName: itemName,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> replyToComment({
    required String commentId,
    required String reply,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.replyToComment(
        commentId: commentId,
        reply: reply,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> sendCourseReview({
    required String courseId,
    required String description,
    required double contentQuality,
    required double instructorSkills,
    required double purchaseWorth,
    required double supportQuality,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.sendCourseReview(
        courseId: courseId,
        description: description,
        contentQuality: contentQuality,
        instructorSkills: instructorSkills,
        purchaseWorth: purchaseWorth,
        supportQuality: supportQuality,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> addCourseFree({
    required String courseId,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.addCourseFree(
        courseId: courseId,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> addQuestion({
    required String courseId,
    required String title,
    required String description,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.addQuestion(
        courseId: courseId,
        title: title,
        description: description,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> editQuestion({
    required String courseId,
    required String title,
    required String description,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.editQuestion(
        courseId: courseId,
        title: title,
        description: description,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, ForumDataModel>> getForums({
    required String courseId,
    required String search,
  }) async {
    return handler.asyncHandler<ForumDataModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.getForums(
        courseId: courseId,
        search: search,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<NoticeModel>>> getNotices({
    required String courseId,
  }) async {
    return handler.asyncHandler<List<NoticeModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.getNotices(
        courseId: courseId,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, ResultModel>> getQuizResult({
    required String quizId,
  }) async {
    return handler.asyncHandler<ResultModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.getQuizResult(
        quizId: quizId,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, StartQuizModel>> startQuiz({
    required String quizId,
  }) async {
    return handler.asyncHandler<StartQuizModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.startQuiz(
        quizId: quizId,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> downloadVideos({
    required String downloadLink,
    required String path,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.downloadVideos(
        downloadLink: downloadLink,
        path: path,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, List<DownLoadModel>>> readDownloadedVideos() async {
    return handler.asyncHandler<List<DownLoadModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      final data = await baseCourseLocalDataSource.readDownloadedVideos();

      return data;
    });
  }

  @override
  Future<Either<Failure, Unit>> writeDownloadedVideos({
    required DownLoad download,
  }) async {
    return handler.asyncHandler<Unit>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      final data = await baseCourseLocalDataSource.writeDownloadedVideos(
        download: DownLoadModel(
          contentDetails: download.contentDetails,
          filePath: download.filePath,
          idCourse: download.idCourse,
          idUser: download.idUser,
          titleCourse: download.titleCourse,
        ),
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, Unit>> removeDownloadedVideos() async {
    return handler.asyncHandler<Unit>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      final data = await baseCourseLocalDataSource.removeDownloadedVideos();

      return data;
    });
  }

  @override
  Future<Either<Failure, List<CourseModel>>> getPurchasesCourses() async {
    return handler.asyncHandler<List<CourseModel>>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.getPurchasesCourses(
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, String>> readLesson({
    required String courseId,
    required String itemId,
    required bool status,
  }) async {
    return handler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.readLesson(
        courseId: courseId,
        itemId: itemId,
        status: status,
        token: token,
        lang: lang,
      );

      return data;
    });
  }

  @override
  Future<Either<Failure, ResultModel>> storeResult({
    required String quizId,
    required String quizResultId,
    required List<QuestionStore> answers,
  }) async {
    return handler.asyncHandler<ResultModel>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      String? token = await baseAuthLocalDataSource.readToken();
      String? lang = await baseLanguageLocalDataSource.readLanguage();

      final data = await baseCourseRemoteDataSource.storeResult(
        quizId: quizId,
        quizResultId: quizResultId,
        answers: answers,
        token: token,
        lang: lang,
      );

      return data;
    });
  }
}
