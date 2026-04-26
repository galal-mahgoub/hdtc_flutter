// ignore_for_file: non_nullable_equals_parameter

import '../../../provider_feature/domain/entities/provider.dart';
import 'can.dart';
import 'last_answer.dart';

class Forum {
  Forum({
    int? id,
    String? title,
    Provider? user,
    bool? pin,
    String? description,
    int? answersCount,
    bool? resolved,
    Can? can,
    int? createdAt,
    List<String>? activeUsers,
    int? more,
    int? lastActivity,
    LastAnswer? lastAnswer,
  }) {
    _id = id.toString();
    _title = title;
    _user = user;
    _pin = pin;
    _description = description;
    _answersCount = answersCount;
    _resolved = resolved;
    _can = can;
    _createdAt = createdAt;
    _activeUsers = activeUsers;
    _more = more;
    _lastActivity = lastActivity;
    _lastAnswer = lastAnswer;
  }

  String? _title;
  Provider? _user;
  bool? _pin;
  String? _description;
  int? _answersCount;
  bool? _resolved;
  Can? _can;
  int? _createdAt;
  List<String>? _activeUsers;
  int? _more;
  int? _lastActivity;
  LastAnswer? _lastAnswer;
  String? _id;

  String get id => _id ?? '';

  String get title => _title ?? '';

  Provider? get user => _user;

  bool get pin => _pin ?? false;

  String get description => _description ?? '';

  int get answersCount => _answersCount ?? 0;

  bool get resolved => _resolved ?? false;

  Can? get can => _can;

  int get createdAt => _createdAt ?? 0;

  List<String> get activeUsers => _activeUsers ?? [];

  int get more => _more ?? 0;

  int get lastActivity => _lastActivity ?? 0;

  LastAnswer get lastAnswer => _lastAnswer ?? LastAnswer();

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      super == other &&
          other is Forum &&
          runtimeType == other.runtimeType &&
          _title == other._title &&
          _user == other._user &&
          _pin == other._pin &&
          _description == other._description &&
          _answersCount == other._answersCount &&
          _resolved == other._resolved &&
          _can == other._can &&
          _createdAt == other._createdAt &&
          _activeUsers == other._activeUsers &&
          _more == other._more &&
          _lastActivity == other._lastActivity &&
          _lastAnswer == other._lastAnswer;

  @override
  int get hashCode =>
      super.hashCode ^
      _title.hashCode ^
      _user.hashCode ^
      _pin.hashCode ^
      _description.hashCode ^
      _answersCount.hashCode ^
      _resolved.hashCode ^
      _can.hashCode ^
      _createdAt.hashCode ^
      _activeUsers.hashCode ^
      _more.hashCode ^
      _lastActivity.hashCode ^
      _lastAnswer.hashCode;
}
