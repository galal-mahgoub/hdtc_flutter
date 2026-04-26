import '../../domain/entities/category.dart';
import 'sub_category_model.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.title,
    required super.color,
    required super.icon,
    required super.subCategories,
    required super.webinarsCount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['title'],
      color: json['color'],
      icon: json['icon'],
      subCategories: List.from(json['sub_categories'])
          .map((e) => SubCategoryModel.fromJson(e))
          .toList(),
      webinarsCount: json['webinars_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'color': color,
      'icon': icon,
      'sub_categories':
          subCategories.map((e) => (e as SubCategoryModel).toJson()).toList(),
      'webinars_count': webinarsCount,
    };
  }
}
