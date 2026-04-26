import '../../../provider_feature/data/models/provider_model.dart';
import '../../domain/entities/result.dart';
import 'course_model.dart';
import 'quiz_model.dart';
import 'quiz_review_model.dart';

class ResultModel extends Result {
  ResultModel({
    required super.id,
    required super.quiz,
    required super.webinar,
    required super.user,
    required super.userGrade,
    required super.status,
    required super.createdAt,
    required super.authCanTryAgain,
    required super.reviewable,
    required super.quizReview,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      id: json['id'],
      webinar: CourseModel.fromJson(json['webinar']),
      quiz: QuizModel.fromJson(json['quiz']),
      user: ProviderModel.fromJson(json['user']),
      createdAt: int.tryParse(json['created_at'].toString()),
      userGrade: int.tryParse(json['user_grade'].toString()),
      status: json['status'],
      authCanTryAgain: json['auth_can_try_again'],
      reviewable: json['reviewable'],
      quizReview: json['quiz_review'] == null
          ? null
          : List.from(json['quiz_review'])
              .map((e) => QuizReviewModel.fromJson(e))
              .toList(),
    );
  }
}
