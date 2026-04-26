// ignore_for_file: non_nullable_equals_parameter

import 'creatorrr.dart';

class Notice {
  Notice({
    String? id,
    String? title,
    String? message,
    String? color,
    int? createdAt,
    String? icon,
    Creator? creator,
  }) {
    _id = id.toString();
    _title = title;
    _message = message;
    _color = color;
    _createdAt = createdAt;
    _icon = icon;
    _creator = creator;
  }

  String? _id;
  String? _title;
  String? _message;
  String? _color;
  int? _createdAt;
  String? _icon;
  Creator? _creator;

  String get id => _id ?? '';

  String get title => _title ?? '';

  String get message => _message ?? '';

  String get color => _color ?? '';

  int get createdAt => _createdAt ?? 0;

  String get icon => _icon ?? '';

  Creator get creator => _creator ?? Creator();

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      super == other &&
          other is Notice &&
          runtimeType == other.runtimeType &&
          _title == other._title &&
          _message == other._message &&
          _color == other._color &&
          _createdAt == other._createdAt &&
          _icon == other._icon &&
          _creator == other._creator;

  @override
  int get hashCode =>
      super.hashCode ^
      _title.hashCode ^
      _message.hashCode ^
      _color.hashCode ^
      _createdAt.hashCode ^
      _icon.hashCode ^
      _creator.hashCode;
}
