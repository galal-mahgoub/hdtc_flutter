import 'package:hdtc_on/features/course_feature/data/models/course_model.dart';

import '../../domain/entities/category_course.dart';

class CategoryCourseModel extends CategoryCourse {
  const CategoryCourseModel({
    required super.filters,
    required super.courses,
  });

  factory CategoryCourseModel.fromJson(Map<String, dynamic> json) {
    return CategoryCourseModel(
      filters: List.from(json['filters'])
          .map((e) => FilterModel.fromJson(e))
          .toList(),
      courses: List.from(json['webinars'])
          .map((e) => CourseModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'options': filters.map((e) => (e as FilterModel).toJson()).toList(),
      'webinars': courses.map((e) => (e as CourseModel).toJson()).toList(),
    };
  }
}

class FilterModel extends Filter {
  const FilterModel({
    required super.id,
    required super.title,
    required super.options,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    return FilterModel(
      id: json['id'],
      title: json['title'],
      options: List.from(json['options'])
          .map((e) => OptionModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'options': options.map((e) => (e as OptionModel).toJson()).toList(),
    };
  }
}

class OptionModel extends Option {
  const OptionModel({
    required super.id,
    required super.title,
    required super.order,
    required super.filtered,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'],
      title: json['title'],
      order: json['order'].toString(),
      filtered: json['filtered'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'order': order,
      'filtered': filtered,
    };
  }
}
