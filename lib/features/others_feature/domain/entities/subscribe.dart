import 'package:equatable/equatable.dart';

class Subscription extends Equatable {
  final int id;
  final String title;
  final String? description;
  final String usableCount;
  final String type;
  final String days;
  final double price;
  final String subscribePriceString;
  final String isPopular;
  final String image;
  final String createdAt;

  const Subscription({
    required this.id,
    required this.title,
    required this.description,
    required this.usableCount,
    required this.type,
    required this.days,
    required this.price,
    required this.subscribePriceString,
    required this.isPopular,
    required this.image,
    required this.createdAt,
  });

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      usableCount,
      type,
      days,
      price,
      subscribePriceString,
      isPopular,
      image,
      createdAt,
    ];
  }
}
