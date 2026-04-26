import '../../domain/entities/sales.dart';

class SalesModel extends Sales {
  const SalesModel({
    required super.count,
    required super.amount,
  });

  factory SalesModel.fromJson(Map<String, dynamic> json) {
    return SalesModel(
      count: json['count'],
      amount: json['amount'],
    );
  }

  Map<String, dynamic> toJson() {
  return {
    'count': count,
    'amount': amount,
  };
}

}
