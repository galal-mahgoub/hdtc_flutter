import 'package:equatable/equatable.dart';

import 'amounts.dart';
import 'discount.dart';
import 'item.dart';

// ignore: must_be_immutable
class Cart extends Equatable {
  final List<Item> items;
  Amounts amounts;
  Discount? discount;

  Cart({
    required this.items,
    required this.amounts,
    required this.discount,
  });

  @override
  List<Object?> get props => [
        items,
        amounts,
        discount,
      ];
}
