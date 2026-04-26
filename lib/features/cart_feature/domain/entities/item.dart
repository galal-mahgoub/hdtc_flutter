import 'package:equatable/equatable.dart';

import 'time.dart';

class Item extends Equatable {
  final int id;
  final String type;
  final String image;
  final String title;
  final String teacherName;
  final double rate;
  final double price;
  final String priceString;
  final String day;
  final Time? time;

  const Item({
    required this.id,
    required this.type,
    required this.image,
    required this.title,
    required this.teacherName,
    required this.rate,
    required this.price,
    required this.priceString,
    required this.day,
    required this.time,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        image,
        title,
        teacherName,
        rate,
        price,
        priceString,
        day,
        time,
      ];
}
