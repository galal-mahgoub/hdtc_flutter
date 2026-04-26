import '../../domain/entities/prerequisite.dart';
import 'course_model.dart';

class PrerequisiteModel extends Prerequisite {
  const PrerequisiteModel({
    required super.requiredd,
    required super.course,
  });

  factory PrerequisiteModel.fromJson(Map<String, dynamic> json) {
    return PrerequisiteModel(
      requiredd: json['required'],
      course: CourseModel.fromJson(json['webinar']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'required': requiredd,
      'webinar': (course as CourseModel).toJson(),
    };
  }
}
