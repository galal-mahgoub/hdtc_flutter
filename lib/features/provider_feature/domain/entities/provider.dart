import 'package:equatable/equatable.dart';

import '../../../auth_feature/domain/entities/badge.dart';
import 'meeting.dart';
import '../../../course_feature/domain/entities/course.dart';
import 'follower.dart';
import 'student.dart';

// ignore: must_be_immutable
class Provider extends Equatable {
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
  final String? address;
  final String? status;
  final String? email;
  final String? mobile;
  final String? language;
  final String? timezone;
  final bool? newsletter;
  final bool? supportSignLanguage;
  final String? publicMessage;
  final List<Badge> badges;
  final List<Student> students;
  List<Follower> followers;
  final List<Course> courses;
  final Meeting? meeting;
  final List<String> education;
  final List<String> experience;
  final List<String> occupations;
  final String? about;
  final String? countryId;
  final String? provinceId;
  final String? cityId;
  final String? districtId;
  final String? organId;
  final String? accountType;
  final String? iban;
  final String? accountId;
  final String? certificate;
  final int? studentsCount;
  int? followersCount;

 

  Provider({
    required this.id,
    required this.fullName,
    required this.roleName,
    required this.bio,
    required this.offline,
    required this.offlineMessage,
    required this.verified,
    required this.rate,
    required this.avatar,
    required this.meetingStatus,
    required this.address,
    required this.status,
    required this.email,
    required this.mobile,
    required this.language,
    required this.timezone,
    required this.newsletter,
    required this.supportSignLanguage,
    required this.publicMessage,
    required this.badges,
    required this.students,
    required this.followers,
    required this.courses,
    required this.meeting,
    required this.education,
    required this.experience,
    required this.occupations,
    required this.about,
    required this.countryId,
    required this.provinceId,
    required this.cityId,
    required this.districtId,
    required this.organId,
    required this.accountType,
    required this.iban,
    required this.accountId,
    required this.certificate,
    required this.studentsCount,
    required this.followersCount,
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
        address,
        status,
        email,
        mobile,
        language,
        timezone,
        newsletter,
        supportSignLanguage,
        publicMessage,
        badges,
        students,
        followers,
        courses,
        meeting,
        education,
        experience,
        occupations,
        about,
        countryId,
        provinceId,
        cityId,
        districtId,
        organId,
        accountType,
        iban,
        accountId,
        certificate,
        studentsCount,
        followersCount,
      ];
}
