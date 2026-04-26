import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hdtc_on/features/course_feature/data/models/course_model.dart';

import 'package:get/get.dart';

import '../../../../core/consts/api_urls.dart';
import '../../../../core/network/handler.dart';
import '../../domain/entities/question_store.dart';
import '../models/content_model.dart';
import '../models/forum_data_model.dart';
import '../models/notice_model.dart';
import '../models/result.dart';
import '../models/start_quiz_model.dart';

abstract class BaseCourseRemoteDataSource {
  Future<List<CourseModel>> featuredCourses({
    String? categoryId,
    required String? token,
    required String? lang,
  });

  Future<List<CourseModel>> myCourses({
    required String? token,
    required String? lang,
  });

  Future<List<CourseModel>> courses({
    required String? sort,
    required String? offset,
    required String? limit,
    required bool? isFree,
    String? categoryId,
    Map<String, Object>? query,
    required String? token,
    required String? lang,
  });

  Future<List<CourseModel>> searchCourses({
    required String? search,
    required String? offset,
    required String? limit,
    required String? token,
    required String? lang,
  });

  Future<CourseModel> courseDetails({
    required String courseId,
    required String? token,
    required String? lang,
  });

  Future<Unit> addFavourite({
    required String courseId,
    required String? token,
    required String? lang,
  });

  Future<List<String>> getReasons({
    required String? token,
    required String? lang,
  });

  Future<String> addReport({
    required String courseId,
    required String reason,
    required String message,
    required String? token,
    required String? lang,
  });

  Future<List<ContentModel>> getCourseContent({
    required String courseId,
    required String? token,
    required String? lang,
  });

  Future<String> sendCourseComment({
    required String courseId,
    required String comment,
    required String itemName,
    required String? token,
    required String? lang,
  });

  Future<String> replyToComment({
    required String commentId,
    required String reply,
    required String? token,
    required String? lang,
  });

  Future<String> sendCourseReview({
    required String courseId,
    required String description,
    required double contentQuality,
    required double instructorSkills,
    required double purchaseWorth,
    required double supportQuality,
    required String? token,
    required String? lang,
  });

  Future<String> addCourseFree({
    required String courseId,
    required String? token,
    required String? lang,
  });

  Future<String> addQuestion({
    required String courseId,
    required String title,
    required String description,
    required String? token,
    required String? lang,
  });

  Future<String> editQuestion({
    required String courseId,
    required String title,
    required String description,
    required String? token,
    required String? lang,
  });

  Future<ForumDataModel> getForums({
    required String courseId,
    required String search,
    required String? token,
    required String? lang,
  });

  Future<List<NoticeModel>> getNotices({
    required String courseId,
    required String? token,
    required String? lang,
  });

  Future<ResultModel> getQuizResult({
    required String quizId,
    required String? token,
    required String? lang,
  });

  Future<StartQuizModel> startQuiz({
    required String quizId,
    required String? token,
    required String? lang,
  });

  Future<String> downloadVideos({
    required String downloadLink,
    required String path,
    required String? token,
    required String? lang,
  });

  Future<List<CourseModel>> getPurchasesCourses({
    required String? token,
    required String? lang,
  });
  Future<String> readLesson({
    required String courseId,
    required String itemId,
    required bool status,
    required String? token,
    required String? lang,
  });
  Future<ResultModel> storeResult({
    required String quizId,
    required String quizResultId,
    required List<QuestionStore> answers,
    required String? token,
    required String? lang,
  });
}

class CourseRemoteDataSource extends GetConnect
    implements BaseCourseRemoteDataSource {
  @override
  Future<List<CourseModel>> myCourses({
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.myCourses,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler<List<CourseModel>?>(
      response,
      response.body?["data"]['webinars'] != null
          ? List.from(response.body['data']['webinars'])
              .map((e) => CourseModel.fromJson(
                    e,
                  ))
              .toList()
          : null,
    );
  }

  @override
  Future<List<CourseModel>> featuredCourses({
    String? categoryId,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var queryParameters = {
      'cat': categoryId,
    };

    Response response = await get(
      ApiUrls.featuredCourses,
      query: queryParameters,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler<List<CourseModel>?>(
      response,
      response.body?["data"] != null
          ? List.from(response.body['data'])
              .map((e) => CourseModel.fromJson(
                    e,
                  ))
              .toList()
          : null,
    );
  }

  @override
  Future<List<CourseModel>> courses({
    required String? sort,
    required String? offset,
    required String? limit,
    required bool? isFree,
    String? categoryId,
    Map<String, Object>? query,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Get.log(
        '${ApiUrls.courses}?page=$offset&paginate=$limit&free=${(isFree ?? false) ? 1 : 0}&sort=$sort');
    Get.log("==>${DateTime.now()}");
    Response response = await get(
      '${ApiUrls.courses}?page=$offset&paginate=$limit&free=${(isFree ?? false) ? 1 : 0}&sort=$sort',
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );
    Get.log("==>${DateTime.now()}");
    // Get.log("==>${response.body}");
    return await Handler.responeHandler<List<CourseModel>?>(
      response,
      response.body?["data"] != null
          ? List.from(response.body['data'])
              .map((e) => CourseModel.fromJson(
                    e,
                  ))
              .toList()
          : null,
    );
  }

  @override
  Future<List<CourseModel>> searchCourses({
    required String? search,
    required String? offset,
    required String? limit,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      '${ApiUrls.searchCourses}?search=$search',
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler<List<CourseModel>?>(
      response,
      response.body?["data"] != null
          ? List.from(response.body['data']['webinars']['webinars'])
              .map((e) => CourseModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }

  @override
  Future<CourseModel> courseDetails({
    required String courseId,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      '${ApiUrls.courseDetails}$courseId',
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    Get.log("courseDetails==>${response.body}");
    return await Handler.responeHandler<CourseModel?>(
      response,
      response.body?["data"] != null
          ? CourseModel.fromJson(response.body['data'])
          : null,
    );
  }

  @override
  Future<Unit> addFavourite({
    required String courseId,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await post(
      '${ApiUrls.addFavorite}$courseId',
      {},
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
  Future<List<String>> getReasons({
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.reasons,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? List.from(response.body['data']).map((e) => e.toString()).toList()
          : null,
    );
  }

  @override
  Future<String> addReport({
    required String courseId,
    required String reason,
    required String message,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var data = {
      'reason': reason,
      'message': message,
    };
    Response response = await post(
      ApiUrls.addReport(courseId: courseId),
      data,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );
    Get.log("addReportCourse==>${response.bodyString}");
    return await Handler.responeHandler(
      response,
      response.body?['message'] ?? '',
    );
  }

  @override
  Future<List<ContentModel>> getCourseContent({
    required String courseId,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.courseContent(courseId: courseId),
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? List.from(response.body['data'])
              .map((e) => ContentModel.fromJson(e))
              .toList()
          : null,
    );
  }

  @override
  Future<String> sendCourseComment({
    required String courseId,
    required String comment,
    required String itemName,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var data = {"item_id": courseId, "item_name": itemName, "comment": comment};
    Response response = await post(
      ApiUrls.addCourseComment,
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

  @override
  Future<String> replyToComment({
    required String commentId,
    required String reply,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var data = {"reply": reply};
    Response response = await post(
      ApiUrls.replyToComment(
        commentId: commentId,
      ),
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

  @override
  Future<String> sendCourseReview({
    required String courseId,
    required String description,
    required double contentQuality,
    required double instructorSkills,
    required double purchaseWorth,
    required double supportQuality,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var data = {
      "webinar_id": courseId,
      "content_quality": contentQuality,
      "instructor_skills": instructorSkills,
      "purchase_worth": purchaseWorth,
      "support_quality": supportQuality,
      "description": description
    };
    Response response = await post(
      ApiUrls.addCourseReview,
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

  @override
  Future<String> addCourseFree({
    required String courseId,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await post(
      ApiUrls.addCourseFree(
        courseId: courseId,
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
  Future<String> addQuestion({
    required String courseId,
    required String title,
    required String description,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var data = {
      "title": title,
      "description": description,
    };
    Response response = await post(
      ApiUrls.forums(
        courseId: courseId,
      ),
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

  @override
  Future<String> editQuestion({
    required String courseId,
    required String title,
    required String description,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var data = {
      "title": title,
      "description": description,
    };
    Response response = await put(
      ApiUrls.editQuestion + courseId,
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

  @override
  Future<ForumDataModel> getForums({
    required String courseId,
    required String search,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var queryParameters = {
      "search": search,
    };
    Response response = await get(
      ApiUrls.forums(
        courseId: courseId,
      ),
      query: queryParameters,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? ForumDataModel.fromJson(response.body["data"])
          : null,
    );
  }

  @override
  Future<List<NoticeModel>> getNotices({
    required String courseId,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.notices(
        courseId: courseId,
      ),
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? List.from(response.body["data"])
              .map((e) => NoticeModel.fromJson(e))
              .toList()
          : null,
    );
  }

  @override
  Future<ResultModel> getQuizResult({
    required String quizId,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.getQuizResult(
        quizId: quizId,
      ),
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? ResultModel.fromJson(response.body["data"])
          : null,
    );
  }

  @override
  Future<StartQuizModel> startQuiz({
    required String quizId,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);

    Response response = await get(
      ApiUrls.startQuiz(
        quizId: quizId,
      ),
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );
    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? StartQuizModel.fromJson(response.body["data"])
          : null,
    );
  }

  @override
  Future<List<CourseModel>> getPurchasesCourses({
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    Response response = await get(
      ApiUrls.purchasesCourses,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? List.from(response.body['data']['webinars'])
              .map((e) => CourseModel.fromJson(
                    e,
                  ))
              .toList()
          : [],
    );
  }

  @override
  Future<String> downloadVideos({
    required String downloadLink,
    required String path,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 2);
    // final appStorage = await getApplicationDocumentsDirectory();
    final file = File(path);

    final respone = await get(
      downloadLink,
    );

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(respone.body);
    await raf.close();

    OpenFile(path, true);
    // return await dio
    //     .downloadUri(Uri.parse(downloadLink), path,
    //         options: d.Options(headers: {'Authorization': 'Bearer $token'}))
    //     .then((value) async {
    //   print(value.statusCode);
    // });
    return 'good';
  }

  @override
  Future<String> readLesson({
    required String courseId,
    required String itemId,
    required bool status,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 1);
    var data = {"item": 'file_id', "item_id": itemId, "status": status};
    Response response = await post(
      ApiUrls.readLesson(courseId: courseId),
      data,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );

    return await Handler.responeHandler(
      response,
      response.body?['message'] ?? '',
    );
  }

  @override
  Future<ResultModel> storeResult({
    required String quizId,
    required String quizResultId,
    required List<QuestionStore> answers,
    required String? token,
    required String? lang,
  }) async {
    httpClient.timeout = const Duration(hours: 2);
    final answerSheet =
        answers.map((element) => element.toJsonCreate()).toList();
    Get.log('storeResult==>$answerSheet');
    var body = {
      'quiz_result_id': quizResultId,
      'answer_sheet': answerSheet,
    };
    Response response = await post(
      ApiUrls.storeResult(quizId: quizId),
      body,
      headers: ApiUrls.getHeaders(
        token: token,
        lang: lang,
      ),
    );
    Get.log('storeResult==>${response.body}');
    return await Handler.responeHandler(
      response,
      response.body?["data"] != null
          ? ResultModel.fromJson(response.body["data"]["result"])
          : null,
    );
  }
}
