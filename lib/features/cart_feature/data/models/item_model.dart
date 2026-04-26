import '../../domain/entities/item.dart';
import 'time_model.dart';

class ItemModel extends Item {
  const ItemModel({
    required super.id,
    required super.type,
    required super.image,
    required super.title,
    required super.teacherName,
    required super.rate,
    required super.price,
    required super.priceString,
    required super.day,
    required super.time,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      type: json['type'] ?? '',
      image: json['image'],
      title: json['title'],
      teacherName: json['teacher_name'],
      rate: double.tryParse(json['rate'].toString()) ?? 0,
      price: double.tryParse(json['price'].toString()) ?? 0,
      priceString: json['price_string'] ?? '',
      day: json['day'] ?? '',
      time: json['time'] == null ? null : TimeModel.fromJson(json['time']),
    );
  }
}
