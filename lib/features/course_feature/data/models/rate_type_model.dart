import '../../domain/entities/rate_type.dart';

class RateTypeModel extends RateType {
  const RateTypeModel({
    required super.contentQuality,
    required super.instructorSkills,
    required super.purchaseWorth,
    required super.supportQuality,
  });

  factory RateTypeModel.fromJson(Map<String, dynamic> json) {
    return RateTypeModel(
      contentQuality: double.parse(json['content_quality'].toString()),
      instructorSkills: double.parse(json['instructor_skills'].toString()),
      purchaseWorth: double.parse(json['purchase_worth'].toString()),
      supportQuality: double.parse(json['support_quality'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contentQuality': contentQuality,
      'instructorSkills': instructorSkills,
      'purchaseWorth': purchaseWorth,
      'supportQuality': supportQuality,
    };
  }
}
