import '../../domain/entities/timing.dart';

class TimingModel extends Timing {
  const TimingModel({
    required super.day,
    required super.startTime,
    required super.endTime,
    required super.id,
    required super.dayLabel,
    required super.time,
  });

  factory TimingModel.fromJson(Map<String, dynamic> json) {
    return TimingModel(
      day: json['day'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      id: json['id'],
      dayLabel: json['day_label'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'start_time': startTime,
      'end_time': endTime,
      'id': id,
      'day_label': dayLabel,
      'time': time,
    };
  }
}
