import '../../domain/entities/sub_category.dart';

class SubCategoryModel extends SubCategory {
  const SubCategoryModel({
    required super.id,
    required super.title,
    required super.icon,
    required super.webinarsCount,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'],
      title: json['title'],
      icon: json['icon'],
      webinarsCount: json['webinars_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'icon': icon,
      'webinars_count': webinarsCount,
    };
  }
}
