import '../../../blog_feature/data/models/comment_model.dart';
import '../../domain/entities/my_comment.dart';

class MyCommentModel extends MyComment {
  const MyCommentModel({
    required super.blogs,
    required super.webinars,
  });

  factory MyCommentModel.fromJson(Map<String, dynamic> json) {
    return MyCommentModel(
      blogs: json['blogs'] == null
          ? []
          : List.from(json['blogs'])
              .map((e) => CommentModel.fromJson(e))
              .toList(),
      webinars: json['webinar'] == null
          ? []
          : List.from(json['webinar'])
              .map((e) => CommentModel.fromJson(e))
              .toList(),
    );
  }
}
