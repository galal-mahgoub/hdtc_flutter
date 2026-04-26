// ignore_for_file: must_be_immutable

import '../../../course_feature/data/models/course_model.dart';
import '../../domain/entities/comment.dart';
import 'blog_model.dart';
import 'reply_model.dart';
import 'user_model.dart' as u;

class CommentModel extends Comment {
  CommentModel({
    required super.id,
    required super.status,
    required super.commentUserType,
    required super.createdAt,
    required super.comment,
    required super.blog,
    required super.user,
    required super.course,
    required super.replies,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
        id: json['id'],
        status: json['status'],
        commentUserType: json['comment_user_type'],
        createdAt: DateTime.parse(json['create_at'].toString()),
        comment: json['comment'] ?? '',
        blog: json['blog'] == null ? null : BlogModel.fromJson(json['blog']),
        user: u.UserModel.fromJson(json['user']),
        course: json['webinar'] == null
            ? null
            : CourseModel.fromJson(json['webinar']),
        replies: json['replies'] == null
            ? []
            : List.from(json['replies'])
                .map((e) => ReplyModel.fromJson(e))
                .toList());
  }
}
