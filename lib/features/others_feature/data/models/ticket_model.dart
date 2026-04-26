// ignore_for_file: must_be_immutable

import '../../../auth_feature/data/models/user_model.dart';
import '../../domain/entities/ticket.dart';

class TicketModel extends Ticket {
  TicketModel({
    required super.id,
    required super.department,
    required super.status,
    required super.type,
    required super.title,
    required super.webinar,
    required super.user,
    required super.conversations,
    required super.createdAt,
    required super.updatedAt,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'],
      department: json['department'],
      status: json['status'],
      type: json['type'],
      title: json['title'],
      webinar: json['webinar'],
      user: UserModel.fromJson(json['user'], null),
      conversations: List.from(json['conversations'])
          .map((x) => ConversationModel.fromJson(x))
          .toList(),
      createdAt: json['created_at'].toString(),
      updatedAt: json['updated_at'].toString(),
    );
  }
}

class ConversationModel extends Conversation {
  const ConversationModel({
    required super.message,
    required super.sender,
    required super.supporter,
    required super.attach,
    required super.createdAt,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      message: json['message'],
      sender: json['sender'] == null
          ? null
          : UserModel.fromJson(json['sender'], null),
      supporter: json['supporter'],
      attach: json['attach'],
      createdAt: json['created_at'].toString(),
    );
  }
}
