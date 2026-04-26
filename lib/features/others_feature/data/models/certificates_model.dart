import 'package:hdtc_on/features/course_feature/data/models/course_model.dart';

import '../../domain/entities/certificate.dart';

class CertificateModel extends Certificate {
  CertificateModel({
    required super.id,
    required super.webinar,
    required super.link,
    required super.date,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) {
    return CertificateModel(
      id: json['id'].toString(),
      webinar: CourseModel.fromJson(json['webinar']),
      link: json['link'],
      date: int.tryParse(json['date'].toString()),
    );
  }
}
