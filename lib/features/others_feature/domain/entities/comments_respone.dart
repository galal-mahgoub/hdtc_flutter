import 'package:equatable/equatable.dart';

import 'my_comment.dart';
import '../../../blog_feature/domain/entities/comment.dart';

class CommentRespone extends Equatable {
  final MyComment myComment;
  final List<Comment> classComment;

  const CommentRespone({
    required this.myComment,
    required this.classComment,
  });

  @override
  List<Object?> get props => [
        myComment,
        classComment,
      ];
}
