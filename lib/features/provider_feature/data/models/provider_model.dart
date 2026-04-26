import '../../../auth_feature/data/models/badge_model.dart';
import '../../../course_feature/data/models/course_model.dart';
import '../../domain/entities/provider.dart';
import 'follower_model.dart';
import 'meeting_model.dart';
import 'student_model.dart';

// ignore: must_be_immutable
class ProviderModel extends Provider {
  ProviderModel({
    required super.id,
    required super.fullName,
    required super.roleName,
    required super.bio,
    required super.offline,
    required super.offlineMessage,
    required super.verified,
    required super.rate,
    required super.avatar,
    required super.meetingStatus,
    required super.address,
    required super.status,
    required super.email,
    required super.mobile,
    required super.language,
    required super.timezone,
    required super.newsletter,
    required super.supportSignLanguage,
    required super.publicMessage,
    required super.badges,
    required super.students,
    required super.followers,
    required super.courses,
    required super.meeting,
    required super.education,
    required super.experience,
    required super.occupations,
    required super.about,
    required super.countryId,
    required super.provinceId,
    required super.cityId,
    required super.districtId,
    required super.organId,
    required super.accountType,
    required super.iban,
    required super.accountId,
    required super.certificate,
    required super.studentsCount,
    required super.followersCount,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
      id: json['id'],
      fullName: json['translated_full_name'],
      roleName: json['role_name'],
      bio: json['bio'],
      offline: json['offline'] == "1",
      offlineMessage: json['offline_message'] ?? "",
      verified: json['verified'] == "1",
      rate: double.parse(json['rate'].toString()),
      avatar: json['avatar'],
      meetingStatus: json['meeting_status'],
      studentsCount: json['students_count'],
      followersCount: json['followers_count'],
      address: json['address'],
      status: json['status'],
      email: json['email'],
      mobile: json['mobile'],
      language: json['language'],
      timezone: json['timezone'],
      newsletter: json['newsletter'],
      supportSignLanguage: json['support_sign_language'],
      publicMessage: json['public_message']?.toString(),
      badges: json['badges'] == null
          ? []
          : List<BadgeModel>.from(
              json['badges'].map((badge) => BadgeModel.fromJson(badge))),
      students: json['students'] == null
          ? []
          : json['students'] is Map
              ? (json['students'] as Map)
                  .values
                  .map((student) => StudentModel.fromJson(student))
                  .toList()
              : List.from(json['students']
                  .map((student) => StudentModel.fromJson(student))),
      followers: json['followers'] == null
          ? []
          : List<FollowerModel>.from(json['followers']
              .map((follower) => FollowerModel.fromJson(follower))),
      courses: json['webinars'] == null
          ? []
          : List<CourseModel>.from(
              json['webinars'].map((webinar) => CourseModel.fromJson(webinar))),
      meeting: json['meeting'] == null
          ? null
          : MeetingModel.fromJson(json['meeting']),
      education:
          json['education'] == null ? [] : List<String>.from(json['education']),
      experience: json['experience'] == null
          ? []
          : List<String>.from(json['experience']),
      occupations: json['occupations'] == null
          ? []
          : List<String>.from(json['occupations']),
      about: json['about'],
      countryId: json['country_id']?.toString(),
      provinceId: json['province_id']?.toString(),
      cityId: json['city_id']?.toString(),
      districtId: json['district_id']?.toString(),
      organId: json['organ_id']?.toString(),
      accountType: json['account_type'],
      iban: json['iban'],
      accountId: json['account_id'],
      certificate: json['certificate'],
    );
  }
}
