// ignore_for_file: must_be_immutable

import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required this.token,
    required super.fullName,
    required super.roleName,
    required super.avatar,
    required super.address,
    required super.email,
    required super.mobile,
    required super.language,
    required super.timezone,
    required super.newsletter,
    required super.supportSignLanguage,
    required super.publicMessage,
    required super.countryId,
    required super.provinceId,
    required super.cityId,
    required super.districtId,
    required super.organId,
    required super.activeSubscription,
  });

  final String? token;

  factory UserModel.fromJson(Map<String, dynamic> json, String? token) {
    return UserModel(
      token: token,
      id: json['id'],
      fullName: json['full_name'] ?? '',
      roleName: json['role_name'] ?? '',
      avatar: json['avatar'] ?? '',
      address: json['address'],
      email: json['email'],
      mobile: json['mobile'],
      language: json['language'],
      timezone: json['timezone'],
      newsletter: json['newsletter'] ?? false,
      supportSignLanguage: json['support_sign_language'] ?? false,
      publicMessage: json['public_message']?.toString(),
      countryId: json['country_id']?.toString(),
      provinceId: json['province_id']?.toString(),
      cityId: json['city_id']?.toString(),
      districtId: json['district_id']?.toString(),
      organId: json['organ_id']?.toString() ?? '0',
      activeSubscription: json['active_subscription'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['role_name'] = roleName;

    data['avatar'] = avatar;

    data['address'] = address;

    data['email'] = email;
    data['mobile'] = mobile;
    data['language'] = language;
    data['timezone'] = timezone;
    data['newsletter'] = newsletter;
    data['support_sign_language'] = supportSignLanguage;
    data['public_message'] = publicMessage;

    data['country_id'] = countryId;
    data['province_id'] = provinceId;
    data['city_id'] = cityId;
    data['district_id'] = districtId;
    data['organ_id'] = organId;
    return data;
  }
}
