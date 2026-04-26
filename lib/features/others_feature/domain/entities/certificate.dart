import '../../../course_feature/domain/entities/course.dart';

class Certificate {
  Certificate({
    String? id,
    Course? webinar,
    String? link,
    int? date,
  }) {
    _id = id.toString();
    _webinar = webinar;
    _link = link;
    _date = date;
  }

  String? _id;
  Course? _webinar;
  String? _link;
  int? _date;

  Course? get webinar => _webinar;

  String get id => _id ?? '';
  String get link => _link ?? '';

  int get date => _date ?? 0;
}
