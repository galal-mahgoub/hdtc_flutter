// ignore_for_file: must_be_immutable

import '../../domain/entities/content.dart';
import 'can_model.dart';

class ContentModel extends Content {
  const ContentModel({
    required super.id,
    required super.title,
    required super.topicsCount,
    required super.createdAt,
    required super.checkAllContentsPass,
    required super.items,
    required super.type,
    required super.isOpen,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      id: json['id'],
      title: json['title'],
      topicsCount: json['topics_count'],
      createdAt: int.parse(json['created_at'].toString()),
      checkAllContentsPass: json['check_all_contents_pass']?.toString() ?? '',
      items:
          List<ItemModel>.from(json['items'].map((x) => ItemModel.fromJson(x))),
      type: json['type'],
      isOpen: json['is_open'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'topics_count': topicsCount,
      'created_at': createdAt,
      'check_all_contents_pass': checkAllContentsPass,
      'items': items.map((e) => (e as ItemModel).toJson()).toList(),
      'type': type,
      'isOpen': isOpen,
    };
  }
}

class ItemModel extends Item {
  ItemModel({
    super.authHasRead,
    super.canViewError,
    super.can,
    super.type,
    super.createdAt,
    super.link,
    super.id,
    super.title,
    super.date,
    super.questionCount,
    super.volume,
    super.time,
    required super.authHasResult,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      authHasRead: json['auth_has_read'] ?? false,
      canViewError: json['can_view_error'],
      can: CanModel.fromJson(json['can']),
      type: json['type'],
      createdAt: int.tryParse(json['created_at'].toString()),
      link: json['link'],
      id: json['id'],
      title: json['title'],
      date: int.tryParse(json['date'].toString()),
      questionCount: json['question_count'],
      volume: json['volume'],
      authHasResult: json['auth_has_result'] ?? false,
      time: int.tryParse(json['time'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'auth_has_read': authHasRead,
      'can_view_error': canViewError,
      'can': (can as CanModel).toJson(),
      'type': type,
      'created_at': createdAt,
      'link': link,
      'id': id,
      'title': title,
      'date': date,
    };
  }
}
