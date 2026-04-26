import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.fullName,
    required super.roleName,
    required super.bio,
    required super.avatar,
    required super.meetingStatus,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      fullName: json['full_name'],
      roleName: json['role_name'],
      bio: json['bio'],
      avatar: json['avatar'],
      meetingStatus: json['meeting_status'],
    );
  }
}
