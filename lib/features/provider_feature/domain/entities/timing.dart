import 'package:equatable/equatable.dart';

class Timing extends Equatable {
  final String? day;
  final String? startTime;
  final String? endTime;
  final int? id;
  final String? dayLabel;
  final String? time;

  const Timing({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.id,
    required this.dayLabel,
    required this.time,
  });

  @override
  List<Object?> get props => [
        id,
        day,
        startTime,
        endTime,
        dayLabel,
        time,
      ];
}
