// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../../course_feature/domain/entities/course.dart';
import 'blog.dart';
import 'reply.dart';
import 'user.dart' as u;

class Comment extends Equatable {
  final int id;
  final String status;
  final String commentUserType;
  final DateTime createdAt;
   String comment;
  final Blog? blog;
  final u.User user;
  final Course? course;
  final List<Reply> replies;

   Comment({
    required this.id,
    required this.status,
    required this.commentUserType,
    required this.createdAt,
    required this.comment,
    required this.blog,
    required this.user,
    required this.course,
    required this.replies,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        commentUserType,
        createdAt,
        comment,
        user,
        blog,
        course,
        replies,
      ];
}
