import 'package:dartz/dartz.dart';
import 'package:hdtc_on/features/course_feature/domain/entities/course.dart';

import '../../../../core/errors/failures.dart';
import '../entities/content.dart';
import '../entities/download.dart';
import '../entities/forum_data.dart';
import '../entities/notice.dart';
import '../entities/question_store.dart';
import '../entities/result.dart';
import '../entities/start_quiz.dart';

abstract class BaseCourseRepository {
  Future<Either<Failure, List<Course>>> featuredCourses({String? categoryId});

  Future<Either<Failure, List<Course>>> myCourses();

  Future<Either<Failure, List<Course>>> courses({
    required String? sort,
    required String? offset,
    required String? limit,
    required bool? isFree,
    String? categoryId,
    Map<String, Object>? query,
  });

  Future<Either<Failure, List<Course>>> searchCourses({
    required String? search,
    required String? offset,
    required String? limit,
  });

  Future<Either<Failure, Course>> courseDetails({
    required String courseId,
  });

  Future<Either<Failure, Unit>> addFavourite({
    required String courseId,
  });

  Future<Either<Failure, List<String>>> getReasons();

  Future<Either<Failure, String>> addReport({
    required String courseId,
    required String reason,
    required String message,
  });

  Future<Either<Failure, List<Content>>> getCourseContent({
    required String courseId,
  });

  Future<Either<Failure, String>> sendCourseComment({
    required String courseId,
    required String comment,
    required String itemName,
  });

  Future<Either<Failure, String>> replyToComment({
    required String commentId,
    required String reply,
  });

  Future<Either<Failure, String>> sendCourseReview({
    required String courseId,
    required String description,
    required double contentQuality,
    required double instructorSkills,
    required double purchaseWorth,
    required double supportQuality,
  });

  Future<Either<Failure, String>> addCourseFree({
    required String courseId,
  });

  Future<Either<Failure, String>> addQuestion({
    required String courseId,
    required String title,
    required String description,
  });

  Future<Either<Failure, String>> editQuestion({
    required String courseId,
    required String title,
    required String description,
  });

  Future<Either<Failure, ForumData>> getForums({
    required String courseId,
    required String search,
  });

  Future<Either<Failure, List<Notice>>> getNotices({
    required String courseId,
  });

  Future<Either<Failure, Result>> getQuizResult({
    required String quizId,
  });

  Future<Either<Failure, StartQuiz>> startQuiz({
    required String quizId,
  });

  Future<Either<Failure, String>> downloadVideos({
    required String downloadLink,
    required String path,
  });

  Future<Either<Failure, List<DownLoad>>> readDownloadedVideos();

  Future<Either<Failure, Unit>> writeDownloadedVideos(
      {required DownLoad download});

  Future<Either<Failure, Unit>> removeDownloadedVideos();
  Future<Either<Failure, List<Course>>> getPurchasesCourses();

  Future<Either<Failure, String>> readLesson({
    required String courseId,
    required String itemId,
    required bool status,
  });

  Future<Either<Failure, Result>> storeResult({
    required String quizId,
    required String quizResultId,
    required List<QuestionStore> answers,
  });
}
