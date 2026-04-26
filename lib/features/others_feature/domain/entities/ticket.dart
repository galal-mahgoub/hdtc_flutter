// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../../auth_feature/domain/entities/user.dart';
import '../../../course_feature/domain/entities/course.dart';

class Ticket extends Equatable {
  final int id;
  final String department;
  final String status;
  final String type;
  final String title;
  final Course? webinar;
  final User user;
  List<Conversation> conversations;
  final String createdAt;
  final String updatedAt;

  Ticket({
    required this.id,
    required this.department,
    required this.status,
    required this.type,
    required this.title,
    required this.webinar,
    required this.user,
    required this.conversations,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        department,
        status,
        type,
        title,
        webinar,
        user,
        conversations,
        createdAt,
        updatedAt,
      ];
}

class Conversation extends Equatable {
  final String message;
  final User? sender;
  final dynamic supporter;
  final String? attach;
  final String createdAt;

  const Conversation({
    required this.message,
    required this.sender,
    required this.supporter,
    required this.attach,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [message, sender, supporter, attach, createdAt];
}
