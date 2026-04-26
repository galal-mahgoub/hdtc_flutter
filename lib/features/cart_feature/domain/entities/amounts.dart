import 'package:equatable/equatable.dart';

class Amounts extends Equatable {
  final double subTotal;
  final String subTotalString;
  final double totalDiscount;
  final String totalDiscountString;
  final double tax;
  final double taxPrice;
  final String taxPriceString;
  final double total;
  final String totalString;

  const Amounts({
    required this.subTotal,
    required this.subTotalString,
    required this.totalDiscount,
    required this.totalDiscountString,
    required this.tax,
    required this.taxPrice,
    required this.taxPriceString,
    required this.total,
    required this.totalString,
  });

  @override
  List<Object?> get props => [
        subTotal,
        subTotalString,
        totalDiscount,
        totalDiscountString,
        tax,
        taxPrice,
        taxPriceString,
        total,
        totalString,
      ];
}
