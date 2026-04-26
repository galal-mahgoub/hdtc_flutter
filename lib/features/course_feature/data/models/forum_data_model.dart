import 'package:hdtc_on/features/course_feature/data/models/forum_model.dart';

import '../../domain/entities/forum_data.dart';

class ForumDataModel extends ForumData {
  ForumDataModel({
    required super.forums,
    required super.answers,
    required super.questionsCount,
    required super.resolvedCount,
    required super.openQuestionsCount,
    required super.commentsCount,
    required super.activeUsersCount,
  });

  factory ForumDataModel.fromJson(Map<String, dynamic> json) {
    return ForumDataModel(
      forums: json['forums'] == null
          ? null
          : List.from(json['forums'])
              .map((e) => ForumModel.fromJson(e))
              .toList(),
      answers: json['answers'] == null
          ? null
          : List.from(json['answers'])
              .map((e) => ForumModel.fromJson(e))
              .toList(),
      questionsCount: int.tryParse(json['questions_count']),
      resolvedCount: int.tryParse(json['resolved_count']),
      openQuestionsCount: int.tryParse(json['open_questions_count']),
      commentsCount: int.tryParse(json['comments_count']),
      activeUsersCount: int.tryParse(json['active_users_count']),
    );
  }
}
