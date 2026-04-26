import 'package:hdtc_on/features/course_feature/data/models/last_answer_model.dart';

import '../../../provider_feature/data/models/provider_model.dart';
import '../../domain/entities/forum.dart';
import 'can_model.dart';

class ForumModel extends Forum {
  ForumModel({
    required super.id,
    required super.title,
    required super.user,
    required super.pin,
    required super.description,
    required super.answersCount,
    required super.resolved,
    required super.can,
    required super.createdAt,
    required super.activeUsers,
    required super.more,
    required super.lastActivity,
    required super.lastAnswer,
  });

  factory ForumModel.fromJson(Map<String, dynamic> json) {
    return ForumModel(
      id: json['id'],
      title: json['title'],
      user: json['user'] != null ? ProviderModel.fromJson(json['user']) : null,
      pin: json['pin'],
      description: json['description'],
      answersCount: json['answers_count'],
      resolved: json['resolved'],
      can: json['can'] != null ? CanModel.fromJson(json['can']) : null,
      createdAt: int.tryParse(json['created_at'].toString()),
      activeUsers: json['active_users'] != null
          ? json['active_users'].cast<String>()
          : [],
      more: int.tryParse(json['more'].toString()),
      lastActivity: int.tryParse(json['last_activity'].toString()),
      lastAnswer: json['last_answer'] != null
          ? LastAnswerModel.fromJson(json['user'])
          : null,
    );
  }
}
