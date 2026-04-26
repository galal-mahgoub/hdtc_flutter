import 'package:hdtc_on/features/course_feature/domain/entities/course.dart';
import 'package:equatable/equatable.dart';

class CategoryCourse extends Equatable {
  final List<Filter> filters;
  final List<Course> courses;

  const CategoryCourse({
    required this.filters,
    required this.courses,
  });

  @override
  List<Object?> get props => [filters, courses];
}

class Filter extends Equatable {
  final int id;
  final String title;
  final List<Option> options;

  const Filter({
    required this.id,
    required this.title,
    required this.options,
  });

  @override
  List<Object?> get props => [id, title, options];
}

class Option extends Equatable {
  final int id;
  final String title;
  final String order;
  final bool filtered;

  const Option({
    required this.id,
    required this.title,
    required this.order,
    required this.filtered,
  });

  @override
  List<Object?> get props => [id, title, order, filtered];
}
