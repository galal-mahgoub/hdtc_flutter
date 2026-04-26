import 'package:equatable/equatable.dart';

class Teacher extends Equatable {
  final int id;
  final String fullName;
  final String? roleName;
  final String? bio;
  final String? offline;
  final String? verified;
  final double rate;
  final String avatar;
  final String meetingStatus;
  final String? address;
  final String? offlineMessage;

  const Teacher({
    required this.id,
    required this.fullName,
    required this.roleName,
    required this.bio,
    required this.offline,
    required this.verified,
    required this.rate,
    required this.avatar,
    required this.meetingStatus,
    required this.address,
    required this.offlineMessage,
  });

  @override
  List<Object?> get props => [
        id,
        fullName,
        roleName,
        bio,
        offline,
        verified,
        rate,
        avatar,
        meetingStatus,
        address,
        offlineMessage,
      ];
}
