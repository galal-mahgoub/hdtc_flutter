import 'package:equatable/equatable.dart';

class Reservation extends Equatable {
  final List<Meeting> requests;
  final List<Meeting> reservations;

  const Reservation({required this.requests, required this.reservations});

  @override
  List<Object?> get props => [requests, reservations];
}

class Meeting extends Equatable {
  final int id;
  final String status;
  final String? link;
  final String userPaidAmount;
  final String? discount;
  final String amount;
  final String date;
  final String day;
  final Time time;
  final String studentCount;
  final String? description;
  final MeetingDetails meeting;
  final User user;

  const Meeting({
    required this.id,
    required this.status,
    required this.link,
    required this.userPaidAmount,
    required this.discount,
    required this.amount,
    required this.date,
    required this.day,
    required this.time,
    required this.studentCount,
    required this.description,
    required this.meeting,
    required this.user,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        link,
        userPaidAmount,
        discount,
        amount,
        date,
        day,
        time,
        studentCount,
        description,
        meeting,
        user,
      ];
}

class Time extends Equatable {
  final String? start;
  final String? end;

  const Time({required this.start, required this.end});

  @override
  List<Object?> get props => [start, end];
}

class MeetingDetails extends Equatable {
  final String timeZone;
  final String gmt;
  final int id;
  final String disabled;
  final String? discount;
  final int price;
  final String priceWithDiscount;
  final String inPerson;
  final int inPersonPrice;
  final int inPersonPriceWithDiscount;
  final String? inPersonGroupMinStudent;
  final String? inPersonGroupMaxStudent;
  final String? inPersonGroupAmount;
  final String groupMeeting;
  final String? onlineGroupMinStudent;
  final String? onlineGroupMaxStudent;
  final String? onlineGroupAmount;
  final List<Time> timing;
  final Map<String, List<Time>> timingGroupByDay;

  const MeetingDetails({
    required this.timeZone,
    required this.gmt,
    required this.id,
    required this.disabled,
    required this.discount,
    required this.price,
    required this.priceWithDiscount,
    required this.inPerson,
    required this.inPersonPrice,
    required this.inPersonPriceWithDiscount,
    required this.inPersonGroupMinStudent,
    required this.inPersonGroupMaxStudent,
    required this.inPersonGroupAmount,
    required this.groupMeeting,
    required this.onlineGroupMinStudent,
    required this.onlineGroupMaxStudent,
    required this.onlineGroupAmount,
    required this.timing,
    required this.timingGroupByDay,
  });

  @override
  List<Object?> get props => [
        timeZone,
        gmt,
        id,
        disabled,
        discount,
        price,
        priceWithDiscount,
        inPerson,
        inPersonPrice,
        inPersonPriceWithDiscount,
        inPersonGroupMinStudent,
        inPersonGroupMaxStudent,
        inPersonGroupAmount,
        groupMeeting,
        onlineGroupMinStudent,
        onlineGroupMaxStudent,
        onlineGroupAmount,
        timing,
        timingGroupByDay,
      ];
}

class User extends Equatable {
  final int id;
  final String fullName;
  final String roleName;
  final String? bio;
  final String offline;
  final String? email;
  final String? offlineMessage;
  final String verified;
  final String? mobile;
  final String rate;
  final String avatar;
  final String meetingStatus;
  final dynamic userGroup;
  final String? address;

  const User({
    required this.id,
    required this.fullName,
    required this.roleName,
    required this.bio,
    required this.email,
    required this.offline,
    required this.offlineMessage,
    required this.verified,
    required this.mobile,
    required this.rate,
    required this.avatar,
    required this.meetingStatus,
    required this.userGroup,
    required this.address,
  });

  @override
  List<Object?> get props => [
        id,
        fullName,
        roleName,
        bio,
        email,
        offline,
        offlineMessage,
        verified,
        mobile,
        rate,
        avatar,
        meetingStatus,
        userGroup,
        address,
      ];
}
