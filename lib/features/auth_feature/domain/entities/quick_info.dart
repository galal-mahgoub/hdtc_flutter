import 'package:equatable/equatable.dart';

class QuickInfo extends Equatable {
  final String roleName;
  final UnreadNotifications? unreadNotifications;
  final List<UnreadNoticeboard>? unreadNoticeboards;
  final int monthlySalesCount;
  final MonthlyChart? monthlyChart;
  final int webinarsCount;
  final int reserveMeetingsCount;
  final int supportsCount;
  final int commentsCount;

  const QuickInfo({
    required this.roleName,
    required this.unreadNotifications,
    required this.unreadNoticeboards,
    required this.monthlySalesCount,
    required this.monthlyChart,
    required this.webinarsCount,
    required this.reserveMeetingsCount,
    required this.supportsCount,
    required this.commentsCount,
  });

  @override
  List<Object?> get props => [
        roleName,
        unreadNotifications,
        unreadNoticeboards,
        monthlySalesCount,
        monthlyChart,
        webinarsCount,
        reserveMeetingsCount,
        supportsCount,
        commentsCount,
      ];
}

class UnreadNotifications extends Equatable {
  final int count;
  final List<Notification> notifications;

  const UnreadNotifications({
    required this.count,
    required this.notifications,
  });

  @override
  List<Object?> get props => [count, notifications];
}

class Notification extends Equatable {
  final int id;
  final String userId;
  final String? senderId;
  final String? groupId;
  final String? webinarId;
  final String title;
  final String message;
  final String sender;
  final String type;
  final String createdAt;

  const Notification({
    required this.id,
    required this.userId,
    required this.senderId,
    required this.groupId,
    required this.webinarId,
    required this.title,
    required this.message,
    required this.sender,
    required this.type,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        senderId,
        groupId,
        webinarId,
        title,
        message,
        sender,
        type,
        createdAt,
      ];
}

class UnreadNoticeboard extends Equatable {
  final int id;
  final String? organId;
  final String? instructorId;
  final String? webinarId;
  final String? userId;
  final String type;
  final String sender;
  final String title;
  final String message;
  final String createdAt;

  const UnreadNoticeboard({
    required this.id,
    required this.organId,
    required this.instructorId,
    required this.webinarId,
    required this.userId,
    required this.type,
    required this.sender,
    required this.title,
    required this.message,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        organId,
        instructorId,
        webinarId,
        userId,
        type,
        sender,
        title,
        message,
        createdAt,
      ];
}

class MonthlyChart extends Equatable {
  final List<String> months;
  final List<int> data;

  const MonthlyChart({
    required this.months,
    required this.data,
  });

  @override
  List<Object?> get props => [months, data];
}
