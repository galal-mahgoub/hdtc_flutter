import 'package:equatable/equatable.dart';

import 'rate_type.dart';

class Review extends Equatable {
  final int id;
  final bool? auth;
  final User user;
  final String createdAt;
  final String description;
  final String rate;
  final RateType rateType;
  final List<dynamic> replies;

  const Review({
    required this.id,
    required this.auth,
    required this.user,
    required this.createdAt,
    required this.description,
    required this.rate,
    required this.rateType,
    required this.replies,
  });

  @override
  List<Object?> get props => [
        id,
        auth,
        user,
        createdAt,
        description,
        rate,
        rateType,
        replies,
      ];
}

class User extends Equatable {
  final String fullName;
  final String avatar;

  const User({
    required this.fullName,
    required this.avatar,
  });

  @override
  List<Object?> get props => [
        fullName,
        avatar,
      ];
}
