import '../../domain/entities/review.dart';
import 'rate_type_model.dart';

class ReviewModel extends Review {
  const ReviewModel({
    required super.id,
    required super.auth,
    required super.user,
    required super.createdAt,
    required super.description,
    required super.rate,
    required super.rateType,
    required super.replies,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      auth: json['auth'],
      user: UserModel.fromJson(json['user']),
      createdAt: json['created_at'].toString(),
      description: json['description'] ?? '',
      rate: json['rate'],
      rateType: RateTypeModel.fromJson(json['rate_type']),
      replies: json['replies'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'auth': auth,
      'user': (user as UserModel).toJson(),
      'created_at': createdAt,
      'description': description,
      'rate': rate,
      'rate_type': (rateType as RateTypeModel).toJson(),
      'replies': replies,
    };
  }
}

class UserModel extends User {
  const UserModel({
    required super.fullName,
    required super.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['full_name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'avatar': avatar,
    };
  }
}
