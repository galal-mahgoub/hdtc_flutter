import 'package:equatable/equatable.dart';

import 'auther.dart';
import 'comment.dart';

class Blog extends Equatable {
  final int id;
  final String title;
  final String image;
  final String description;
  final String? content;
  final DateTime createdAt;
  final Author author;
  final int commentCount;
  final List<Comment> comments;

  const Blog({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.content,
    required this.createdAt,
    required this.author,
    required this.commentCount,
    required this.comments,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        image,
        description,
        content,
        createdAt,
        author,
        commentCount,
        comments,
      ];
}
