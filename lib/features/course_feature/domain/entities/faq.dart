import 'package:equatable/equatable.dart';

class Faq extends Equatable {
  final int id;
  final String title;
  final String answer;
  final String? order;
  final String createdAt;
  final String? updatedAt;

  const Faq({
    required this.id,
    required this.title,
    required this.answer,
    this.order,
    required this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [id, title, answer, order, createdAt, updatedAt];
}
