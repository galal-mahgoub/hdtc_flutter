import '../../domain/entities/subscribe.dart';

class SubscriptionModel extends Subscription {
  const SubscriptionModel({
    required super.id,
    required super.title,
    required super.description,
    required super.usableCount,
    required super.type,
    required super.days,
    required super.price,
    required super.subscribePriceString,
    required super.isPopular,
    required super.image,
    required super.createdAt,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      usableCount: json['usable_count'].toString(),
      type: json['type'],
      days: json['days'].toString(),
      price: double.parse(json['price'].toString()),
      
      subscribePriceString: json['price_string'],
      isPopular: json['is_popular'].toString(),
      image: json['image'],
      createdAt: json['created_at'].toString(),
    );
  }
}
