import '../../domain/entities/blog.dart';
import 'auther_model.dart';
import 'comment_model.dart';


class BlogModel extends Blog {
  const BlogModel({
    required super.id,
    required super.title,
    required super.image,
    required super.description,
    required super.content,
    required super.createdAt,
    required super.author,
    required super.commentCount,
    required super.comments,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
      content: json['content'],
      createdAt: DateTime.parse(json['created_at'].toString()),
      author: AuthorModel.fromJson(json['author']),
      commentCount: json['comment_count'],
      comments: json['comments'] == null
          ? []
          : (json['comments'] as List)
              .map((commentJson) => CommentModel.fromJson(commentJson))
              .toList(),
    );
  }
}
