import '../../domain/entities/quick_info.dart';

class QuickInfoModel extends QuickInfo {
  const QuickInfoModel({
    required super.roleName,
    required super.unreadNotifications,
    required super.unreadNoticeboards,
    required super.monthlySalesCount,
    required super.monthlyChart,
    required super.webinarsCount,
    required super.reserveMeetingsCount,
    required super.supportsCount,
    required super.commentsCount,
  });

  factory QuickInfoModel.fromJson(Map<String, dynamic> json) {
    return QuickInfoModel(
      roleName: json['role_name'] ?? '',
      unreadNotifications: json['unread_notifications'] == null
          ? null
          : UnreadNotificationsModel.fromJson(json['unread_notifications']),
      unreadNoticeboards: json['unread_noticeboards'] == null
          ? null
          : List.from(json['unread_noticeboards'])
              .map((e) => UnreadNoticeboardModel.fromJson(e))
              .toList(),
      monthlySalesCount: json['monthlySalesCount'] ?? 0,
      monthlyChart: json['monthlyChart'] == null
          ? null
          : MonthlyChartModel.fromJson(json['monthlyChart']),
      webinarsCount: json['webinarsCount'] ?? 0,
      reserveMeetingsCount: json['reserveMeetingsCount'] ?? 0,
      supportsCount: json['supportsCount'] ?? 0,
      commentsCount: json['commentsCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role_name': roleName,
      'unread_notifications':
          (unreadNotifications as UnreadNotificationsModel).toJson(),
      'unread_noticeboards': (unreadNoticeboards ?? [])
          .map((e) => (e as UnreadNoticeboardModel).toJson())
          .toList(),
      'monthlySalesCount': monthlySalesCount,
      'monthlyChart': (monthlyChart as MonthlyChartModel).toJson(),
      'webinarsCount': webinarsCount,
      'reserveMeetingsCount': reserveMeetingsCount,
      'supportsCount': supportsCount,
      'commentsCount': commentsCount,
    };
  }
}

class UnreadNotificationsModel extends UnreadNotifications {
  const UnreadNotificationsModel({
    required super.count,
    required super.notifications,
  });

  factory UnreadNotificationsModel.fromJson(Map<String, dynamic> json) {
    return UnreadNotificationsModel(
      count: json['count'],
      notifications: List.from(json['notifications'])
          .map((e) => NotificationModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'notifications':
          notifications.map((e) => (e as NotificationModel).toJson()).toList(),
    };
  }
}

class NotificationModel extends Notification {
  const NotificationModel({
    required super.id,
    required super.userId,
    required super.senderId,
    required super.groupId,
    required super.webinarId,
    required super.title,
    required super.message,
    required super.sender,
    required super.type,
    required super.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      userId: json['user_id'].toString(),
      senderId: json['sender_id'],
      groupId: json['group_id'],
      webinarId: json['webinar_id'],
      title: json['title'],
      message: json['message'],
      sender: json['sender'],
      type: json['type'],
      createdAt: json['created_at'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'sender_id': senderId,
      'group_id': groupId,
      'webinar_id': webinarId,
      'title': title,
      'message': message,
      'sender': sender,
      'type': type,
      'created_at': createdAt,
    };
  }
}

class UnreadNoticeboardModel extends UnreadNoticeboard {
  const UnreadNoticeboardModel({
    required super.id,
    required super.organId,
    required super.instructorId,
    required super.webinarId,
    required super.userId,
    required super.type,
    required super.sender,
    required super.title,
    required super.message,
    required super.createdAt,
  });

  factory UnreadNoticeboardModel.fromJson(Map<String, dynamic> json) {
    return UnreadNoticeboardModel(
      id: json['id'],
      organId: json['organ_id']?.toString(),
      instructorId: json['instructor_id'],
      webinarId: json['webinar_id'],
      userId: json['user_id'],
      type: json['type'],
      sender: json['sender'],
      title: json['title'],
      message: json['message'],
      createdAt: json['created_at'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'organ_id': organId,
      'instructor_id': instructorId,
      'webinar_id': webinarId,
      'user_id': userId,
      'type': type,
      'sender': sender,
      'title': title,
      'message': message,
      'created_at': createdAt,
    };
  }
}

class MonthlyChartModel extends MonthlyChart {
  const MonthlyChartModel({
    required super.months,
    required super.data,
  });

  factory MonthlyChartModel.fromJson(Map<String, dynamic> json) {
    return MonthlyChartModel(
      months: List.from(json['months']).map((e) => e.toString()).toList(),
      data:
          List.from(json['data']).map((e) => int.parse(e.toString())).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'months': months,
      'data': data,
    };
  }
}
