import '../../domain/entities/faq.dart';

class FaqModel extends Faq {
  const FaqModel({
    required super.id,
    required super.title,
    required super.answer,
    super.order,
    required super.createdAt,
    super.updatedAt,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      id: json['id'],
      title: json['title'],
      answer: json['answer'],
      order: json['order']?.toString(),
      createdAt: json['created_at'].toString(),
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'answer': answer,
      'order': order,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
