import 'package:equatable/equatable.dart';

class Follower extends Equatable {
  final int? id;
  final String? fullName;
  final String? roleName;
  final String? bio;
  final bool? offline;
  final String? offlineMessage;
  final bool? verified;
  final int? rate;
  final String? avatar;
  final String? meetingStatus;
  final dynamic userGroup;
  final String? address;

  const Follower({
    this.id,
    this.fullName,
    this.roleName,
    this.bio,
    this.offline,
    this.offlineMessage,
    this.verified,
    this.rate,
    this.avatar,
    this.meetingStatus,
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
