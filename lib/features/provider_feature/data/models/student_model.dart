import '../../domain/entities/student.dart';

class StudentModel extends Student {
  const StudentModel({
    required super.id,
    required super.fullName,
    required super.roleName,
    super.bio,
    required super.offline,
    super.offlineMessage,
    required super.verified,
    required super.rate,
    required super.avatar,
    required super.meetingStatus,
    super.userGroup,
    super.address,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      fullName: json['translated_full_name'],
      roleName: json['role_name'],
      bio: json['bio'],
      offline: json['offline'] == "1",
      offlineMessage: json['offline_message'],
      verified: json['verified'] == "1",
      rate: double.parse(json['rate'].toString()),
      avatar: json['avatar'],
      meetingStatus: json['meeting_status'],
      userGroup: json['user_group'],
      address: json['address'],
    );
  }
}
