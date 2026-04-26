import '../../domain/entities/amounts.dart';

class AmountsModel extends Amounts {
  const AmountsModel({
    required super.subTotal,
    required super.subTotalString,
    required super.totalDiscount,
    required super.totalDiscountString,
    required super.tax,
    required super.taxPrice,
    required super.taxPriceString,
    required super.total,
    required super.totalString,
  });

  factory AmountsModel.fromJson(Map<String, dynamic> json) {
    return AmountsModel(
      subTotal: json['sub_total'].toDouble(),
      subTotalString: json['sub_total_string'].toString(),
      totalDiscount: json['total_discount'].toDouble(),
      totalDiscountString: json['total_discount_string'].toString(),
      tax: json['tax'].toDouble(),
      taxPrice: json['tax_price'].toDouble(),
      taxPriceString: json['tax_price_string'].toString(),
      total: json['total'].toDouble(),
      totalString: json['total_string'].toString(),
    );
  }
}
