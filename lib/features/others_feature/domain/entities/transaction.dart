import 'package:equatable/equatable.dart';

import '../../../course_feature/domain/entities/course.dart';
import 'subscribe.dart';

class Transaction extends Equatable {
  final String type;
  final String balanceType;
  final Course? webinar;
  final Subscription? subscribe;
  final dynamic promotion;
  final dynamic registrationPackage;
  final String description;
  final double amount;
  final String amountString;
  final String createdAt;

  const Transaction({
    required this.type,
    required this.balanceType,
    required this.webinar,
    required this.subscribe,
    required this.promotion,
    required this.registrationPackage,
    required this.description,
    required this.amount,
    required this.amountString,
    required this.createdAt,
  });

  @override
  List<Object?> get props {
    return [
      type,
      balanceType,
      webinar,
      subscribe,
      promotion,
      registrationPackage,
      description,
      amount,
      amountString,
      createdAt,
    ];
  }
}
