import '../../domain/entities/ticket.dart';

class TicketModel extends Ticket {
  const TicketModel({
    required super.id,
    required super.title,
    required super.subTitle,
    required super.discount,
    required super.priceWithTicketDiscount,
    required super.isValid,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'],
      title: json['title'],
      subTitle: json['sub_title'],
      discount: json['discount'],
      priceWithTicketDiscount: json['price_with_ticket_discount'],
      isValid: json['is_valid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'sub_title': subTitle,
      'discount': discount,
      'price_with_ticket_discount': priceWithTicketDiscount,
      'is_valid': isValid,
    };
  }
}
