import 'package:equatable/equatable.dart';

class Student extends Equatable {
  final int id;
  final String fullName;
  final String roleName;
  final String? bio;
  final bool offline;
  final String? offlineMessage;
  final bool verified;
  final double rate;
  final String avatar;
  final String meetingStatus;
  final dynamic userGroup;
  final String? address;

  const Student({
    required this.id,
    required this.fullName,
    required this.roleName,
    this.bio,
    required this.offline,
    this.offlineMessage,
    required this.verified,
    required this.rate,
    required this.avatar,
    required this.meetingStatus,
    this.userGroup,
    this.address,
  });

  @override
  List<Object?> get props => [
        id,
        fullName,
        roleName,
        bio,
        offline,
        offlineMessage,
        verified,
        rate,
        avatar,
        meetingStatus,
        userGroup,
        address,
      ];
}
