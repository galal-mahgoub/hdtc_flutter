import '../../domain/entities/active_special.dart';

class ActiveSpecialOfferModel extends ActiveSpecialOffer {
  const ActiveSpecialOfferModel({
    super.id,
    super.creatorId,
    super.webinarId,
    super.name,
    super.percent,
    super.status,
    super.createdAt,
    super.fromDate,
    super.toDate,
  });

  factory ActiveSpecialOfferModel.fromJson(Map<String, dynamic> json) {
    return ActiveSpecialOfferModel(
      id: json['id'],
      creatorId: json['creatorId'],
      webinarId: json['webinarId'],
      name: json['name'],
      percent: json['percent'],
      status: json['status'],
      createdAt: json['createdAt'],
      fromDate: json['fromDate'],
      toDate: json['toDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creatorId': creatorId,
      'webinarId': webinarId,
      'name': name,
      'percent': percent,
      'status': status,
      'createdAt': createdAt,
      'fromDate': fromDate,
      'toDate': toDate,
    };
  }
}
