import '../../domain/entities/time.dart';

class TimeModel extends Time {
  const TimeModel({
    required super.start,
    required super.end,
  });

  factory TimeModel.fromJson(Map<String, dynamic> json) {
    return TimeModel(
      start: json['start'],
      end: json['end'],
    );
  }
}
