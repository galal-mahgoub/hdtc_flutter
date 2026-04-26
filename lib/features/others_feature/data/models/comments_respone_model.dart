import '../../../blog_feature/data/models/comment_model.dart';
import '../../domain/entities/comments_respone.dart';
import 'my_comment_model.dart';

class CommentResponeModel extends CommentRespone {
  const CommentResponeModel({
    required super.myComment,
    required super.classComment,
  });

  factory CommentResponeModel.fromJson(Map<String, dynamic> json) {
    return CommentResponeModel(
      myComment: MyCommentModel.fromJson(json['my_comment']),
      classComment: json['class_comment'] == null
          ? []
          : List.from(json['class_comment'])
              .map((e) => CommentModel.fromJson(e))
              .toList(),
    );
  }
}
