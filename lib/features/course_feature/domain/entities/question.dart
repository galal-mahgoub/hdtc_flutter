import 'package:equatable/equatable.dart';

import 'quiz_review.dart';

// ignore: must_be_immutable
class Question extends Equatable {
  Question({
    int? id,
    String? title,
    String? type,
    String? grade,
    int? createdAt,
    List<Answer>? answers,
  }) {
    _id = id.toString();
    _title = title;
    _type = type;
    _grade = grade;
    _createdAt = createdAt;
    _answers = answers;
  }

  String? _id;
  String? _title;
  String? _type;
  String? _grade;
  int? _createdAt;
  List<Answer>? _answers;

  String get id => _id ?? '';

  String get title => _title ?? '';

  String get type => _type ?? '';

  String get grade => _grade ?? '';

  int get createdAt => _createdAt ?? 0;

  List<Answer> get answers => _answers ?? [];

  @override
  List<Object?> get props => [_id, _title, _type, _grade, _createdAt, _answers];
}
