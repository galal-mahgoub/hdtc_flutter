import '../../domain/entities/notice.dart';
import 'creator_model.dart';

class NoticeModel extends Notice {
  NoticeModel({
    required super.id,
    required super.title,
    required super.message,
    required super.color,
    required super.createdAt,
    required super.icon,
    required super.creator,
  });

  factory NoticeModel.fromJson(Map<String, dynamic> json) {
    return NoticeModel(
      id: json['id'].toString(),
      title: json['title'],
      message: json['message'],
      color: json['color'],
      createdAt: int.tryParse(json['created_at'].toString()),
      icon: json['icon'],
      creator: json['creator'] == null
          ? null
          : CreatorModel.fromJson(json['creator']),
    );
  }
}
