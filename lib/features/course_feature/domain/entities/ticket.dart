import 'package:equatable/equatable.dart';

class Ticket extends Equatable {
  final int id;
  final String title;
  final String subTitle;
  final String discount;
  final int priceWithTicketDiscount;
  final bool isValid;

  const Ticket({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.discount,
    required this.priceWithTicketDiscount,
    required this.isValid,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        subTitle,
        discount,
        priceWithTicketDiscount,
        isValid,
      ];
}
