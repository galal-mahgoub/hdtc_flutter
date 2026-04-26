import '../../domain/entities/discount.dart';

class DiscountModel extends Discount {
  const DiscountModel({
    required super.id,
  });

  factory DiscountModel.fromJson(Map<String, dynamic> json) {
    return DiscountModel(
      id: json['id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
