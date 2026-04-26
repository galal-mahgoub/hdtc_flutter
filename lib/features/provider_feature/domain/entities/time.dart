import 'package:equatable/equatable.dart';

import 'meeting.dart';

class Time extends Equatable {
  final int id;
  final String time;
  final bool canReserve;
  final String? description;
  final String meetingType;
  final Meeting meeting;
  final dynamic authReservation;

  const Time({
    required this.id,
    required this.time,
    required this.canReserve,
    required this.description,
    required this.meetingType,
    required this.meeting,
    required this.authReservation,
  });

  @override
  List<Object?> get props => [
        id,
        time,
        canReserve,
        description,
        meetingType,
        meeting,
        authReservation,
      ];
}
