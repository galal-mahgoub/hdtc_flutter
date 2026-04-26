import 'package:equatable/equatable.dart';

import '../../../blog_feature/domain/entities/comment.dart';

class MyComment extends Equatable {
  final List<Comment> blogs;
  final List<Comment> webinars;

  const MyComment({
    required this.blogs,
    required this.webinars,
  });

  @override
  List<Object?> get props => [
        blogs,
        webinars,
      ];
}
