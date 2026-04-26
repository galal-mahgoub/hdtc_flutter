import '../../domain/entities/blog_category.dart';

class BlogCategoryModel extends BlogCategory {
  const BlogCategoryModel({
    required super.id,
    required super.title,
  });

  factory BlogCategoryModel.fromJson(Map<String, dynamic> json) {
    return BlogCategoryModel(
      id: json['id'],
      title: json['title'],
    );
  }
}
