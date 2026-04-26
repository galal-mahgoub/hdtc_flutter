import '../../../course_feature/data/models/course_model.dart';
import '../../domain/entities/transaction.dart';
import 'subscribe_model.dart';

class TransactionModel extends Transaction {
  const TransactionModel({
    required super.type,
    required super.balanceType,
    required super.webinar,
    required super.subscribe,
    required super.promotion,
    required super.registrationPackage,
    required super.description,
    required super.amount,
    required super.amountString,
    required super.createdAt,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      type: json['type'],
      balanceType: json['balance_type'],
      webinar: json['webinar'] == null
          ? null
          : CourseModel.fromJson(json['webinar']),
      subscribe: json['subscribe'] == null
          ? null
          : SubscriptionModel.fromJson(json['subscribe']),
      promotion: json['promotion'],
      registrationPackage: json['registration_package'],
      description: json['description'],
      amount: double.parse(json['amount']?.toString() ?? '0'),
      amountString: json['amount_string'] ?? '',
      createdAt: json['created_at'].toString(),
    );
  }
}
