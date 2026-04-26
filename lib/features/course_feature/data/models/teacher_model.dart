import 'package:hdtc_on/features/course_feature/domain/entities/teacher.dart';

class TeacherModel extends Teacher {
  const TeacherModel({
    required super.id,
    required super.fullName,
    required super.roleName,
    required super.bio,
    required super.offline,
    required super.verified,
    required super.rate,
    required super.avatar,
    required super.meetingStatus,
    required super.address,
    required super.offlineMessage,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      id: json['id'],
      fullName: json['translated_full_name'],
      roleName: json['role_name'],
      bio: json['bio'],
      offline: json['offline']?.toString(),
      verified: json['verified']?.toString(),
      rate: double.parse(json['rate'].toString()),
      avatar: json['avatar'],
      meetingStatus: json['meeting_status'],
      address: json['address'],
      offlineMessage: json['offline_message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'roleName': roleName,
      'bio': bio,
      'offline': offline,
      'verified': verified,
      'rate': rate,
      'avatar': avatar,
      'meetingStatus': meetingStatus,
      'address': address,
    };
  }
}
