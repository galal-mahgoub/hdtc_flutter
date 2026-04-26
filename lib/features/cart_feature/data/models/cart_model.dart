import '../../domain/entities/cart.dart';
import 'amounts_model.dart';
import 'discount_model.dart';
import 'item_model.dart';

// ignore: must_be_immutable
class CartModel extends Cart {
  CartModel({
    required super.items,
    required super.amounts,
    required super.discount,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      items: json['items'] == null
          ? []
          : List.from(json['items']).map((e) => ItemModel.fromJson(e)).toList(),
      amounts: AmountsModel.fromJson(json['amounts']),
      discount: json['discount'] == null
          ? null
          : DiscountModel.fromJson(json['discount']),
    );
  }
}
