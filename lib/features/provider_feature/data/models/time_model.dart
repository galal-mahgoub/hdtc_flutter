import '../../domain/entities/time.dart';
import 'meeting_model.dart';
import 'timing_model.dart';

class TimeModel extends Time {
  const TimeModel({
    required super.id,
    required super.time,
    required super.canReserve,
    required super.description,
    required super.meetingType,
    required super.meeting,
    required super.authReservation,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'time': time,
      'can_reserve': canReserve,
      'description': description,
      'meeting_type': meetingType,
      'meeting': (meeting as TimingModel).toJson(),
      'auth_reservation': authReservation,
    };
  }

  factory TimeModel.fromJson(Map<String, dynamic> json) {
    return TimeModel(
      id: json['id'],
      time: json['time'],
      canReserve: json['can_reserve'],
      description: json['description'],
      meetingType: json['meeting_type'],
      meeting: MeetingModel.fromJson(json['meeting']),
      authReservation: json['auth_reservation'],
    );
  }
}
