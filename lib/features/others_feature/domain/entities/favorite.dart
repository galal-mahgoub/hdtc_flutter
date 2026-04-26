// ignore_for_file: non_nullable_equals_parameter

import '../../../course_feature/domain/entities/course.dart';

class Favorite {
  Favorite({
    String? id,
    Course? webinar,
    int? createdAt,
  }) {
    _id = id.toString();
    _webinar = webinar;
    _createdAt = createdAt;
  }

  String? _id;
  Course? _webinar;
  int? _createdAt;

  String? get id => _id;
  Course? get webinar => _webinar;

  int get createdAt => _createdAt ?? 0;

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      super == other &&
          other is Favorite &&
          runtimeType == other.runtimeType &&
          _webinar == other._webinar &&
          _createdAt == other._createdAt;

  @override
  int get hashCode => super.hashCode ^ _webinar.hashCode ^ _createdAt.hashCode;
}
