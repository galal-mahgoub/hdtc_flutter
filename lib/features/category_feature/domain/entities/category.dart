import 'package:equatable/equatable.dart';

import 'sub_category.dart';

class Category extends Equatable {
  final int id;
  final String title;
  final String? color;
  final String icon;
  final List<SubCategory> subCategories;
  final int webinarsCount;

  const Category({
    required this.id,
    required this.title,
    required this.color,
    required this.icon,
    required this.subCategories,
    required this.webinarsCount,
  });

  @override
  List<Object?> get props =>
      [id, title, color, icon, subCategories, webinarsCount];
}
