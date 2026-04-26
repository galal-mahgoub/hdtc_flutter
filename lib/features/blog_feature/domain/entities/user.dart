import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String fullName;
  final String roleName;
  final String? bio;
  final String avatar;
  final String meetingStatus;

  const User({
    required this.id,
    required this.fullName,
    required this.roleName,
    required this.bio,
    required this.avatar,
    required this.meetingStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullName: json['full_name'],
      roleName: json['role_name'],
      bio: json['bio'],
      avatar: json['avatar'],
      meetingStatus: json['meeting_status'],
    );
  }

  @override
  List<Object?> get props =>
      [id, fullName, roleName, bio, avatar, meetingStatus];
}
