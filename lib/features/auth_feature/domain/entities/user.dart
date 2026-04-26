// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class User extends Equatable {
  int? id;
  String fullName;
  String? roleName;
  String avatar;
  String? address;
  String? email;
  String? mobile;
  String? language;
  String? timezone;
  bool? newsletter;
  bool? supportSignLanguage;
  String? publicMessage;
  String? countryId;
  String? provinceId;
  String? cityId;
  String? districtId;
  String? organId;
  dynamic activeSubscription;

  User({
    required this.id,
    required this.fullName,
    required this.roleName,
    required this.avatar,
    required this.address,
    required this.email,
    required this.mobile,
    required this.language,
    required this.timezone,
    required this.newsletter,
    required this.supportSignLanguage,
    required this.publicMessage,
    required this.countryId,
    required this.provinceId,
    required this.cityId,
    required this.districtId,
    required this.organId,
    required this.activeSubscription,
  });

  @override
  List<Object?> get props => [
        id,
        fullName,
        roleName,
        avatar,
        address,
        email,
        mobile,
        language,
        timezone,
        newsletter,
        supportSignLanguage,
        publicMessage,
        countryId,
        provinceId,
        cityId,
        districtId,
        organId,
        activeSubscription,
      ];
}
