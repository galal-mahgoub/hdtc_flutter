import 'package:equatable/equatable.dart';

import 'course.dart';

class Prerequisite extends Equatable {
  final String requiredd;
  final Course course;

  const Prerequisite({required this.requiredd, required this.course});

  @override
  List<Object?> get props => [requiredd, course];
}
