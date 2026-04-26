import '../../domain/entities/reservation.dart';

class ReservationModel extends Reservation {
  const ReservationModel(
      {required super.requests, required super.reservations});

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      requests: List.from(json['requests']['meetings'])
          .map((meeting) => MeetingModel.fromJson(meeting))
          .toList(),
      reservations: List.from(json['reservations']['meetings'])
          .map((meeting) => MeetingModel.fromJson(meeting))
          .toList(),
    );
  }
}

class MeetingModel extends Meeting {
  const MeetingModel({
    required super.id,
    required super.status,
    required super.link,
    required super.userPaidAmount,
    required super.discount,
    required super.amount,
    required super.date,
    required super.day,
    required super.time,
    required super.studentCount,
    required super.description,
    required super.meeting,
    required super.user,
  });

  factory MeetingModel.fromJson(Map<String, dynamic> json) {
    return MeetingModel(
      id: json['id'],
      status: json['status'],
      link: json['link'],
      userPaidAmount: json['user_paid_amount'].toString(),
      discount: json['discount'],
      amount: json['amount'],
      date: json['date'].toString(),
      day: json['day'],
      time: TimeModel.fromJson(json['time']),
      studentCount: json['student_count'].toString(),
      description: json['description'],
      meeting: MeetingDetailsModel.fromJson(json['meeting']),
      user: UserModel.fromJson(json['user']),
    );
  }
}

class TimeModel extends Time {
  const TimeModel({required super.start, required super.end});

  factory TimeModel.fromJson(Map<String, dynamic> json) {
    return TimeModel(
      start: json['start'],
      end: json['end'],
    );
  }
}

class MeetingDetailsModel extends MeetingDetails {
  const MeetingDetailsModel({
    required super.timeZone,
    required super.gmt,
    required super.id,
    required super.disabled,
    required super.discount,
    required super.price,
    required super.priceWithDiscount,
    required super.inPerson,
    required super.inPersonPrice,
    required super.inPersonPriceWithDiscount,
    required super.inPersonGroupMinStudent,
    required super.inPersonGroupMaxStudent,
    required super.inPersonGroupAmount,
    required super.groupMeeting,
    required super.onlineGroupMinStudent,
    required super.onlineGroupMaxStudent,
    required super.onlineGroupAmount,
    required super.timing,
    required super.timingGroupByDay,
  });

  factory MeetingDetailsModel.fromJson(Map<String, dynamic> json) {
    return MeetingDetailsModel(
      timeZone: json['time_zone'],
      gmt: json['gmt'],
      id: json['id'],
      disabled: json['disabled'].toString(),
      discount: json['discount'],
      price: json['price'],
      priceWithDiscount: json['price_with_discount'].toString(),
      inPerson: json['in_person'].toString(),
      inPersonPrice: json['in_person_price'],
      inPersonPriceWithDiscount: json['in_person_price_with_discount'],
      inPersonGroupMinStudent: json['in_person_group_min_student'].toString(),
      inPersonGroupMaxStudent: json['in_person_group_max_student'].toString(),
      inPersonGroupAmount: json['in_person_group_amount '].toString(),
      groupMeeting: json['group_meeting'].toString(),
      onlineGroupMinStudent: json['online_group_min_student'].toString(),
      onlineGroupMaxStudent: json['online_group_max_student'].toString(),
      onlineGroupAmount: json['online_group_amount'].toString(),
      timing: List<TimeModel>.from(
          json['timing'].map((timing) => TimeModel.fromJson(timing))),
      timingGroupByDay: json['timing_group_by_day']
          .map<String, List<TimeModel>>((key, value) => MapEntry(
              key.toString(),
              List<TimeModel>.from(
                  value.map((time) => TimeModel.fromJson(time))))),
    );
  }
}

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.fullName,
    required super.roleName,
    required super.bio,
    required super.offline,
    required super.email,
    required super.offlineMessage,
    required super.verified,
    required super.mobile,
    required super.rate,
    required super.avatar,
    required super.meetingStatus,
    required super.userGroup,
    required super.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['translated_full_name'],
      roleName: json['role_name'],
      mobile: json['mobile'],
      email: json['email'],
      bio: json['bio'],
      offline: json['offline'].toString(),
      offlineMessage: json['offline_message'],
      verified: json['verified'].toString(),
      rate: json['rate'].toString(),
      avatar: json['avatar'],
      meetingStatus: json['meeting_status'],
      userGroup: json['user_group'],
      address: json['address'],
    );
  }
}
