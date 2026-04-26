// ignore_for_file: non_nullable_equals_parameter

import 'forum.dart';

class ForumData {
  ForumData({
    List<Forum>? forums,
    List<Forum>? answers,
    int? questionsCount,
    int? resolvedCount,
    int? openQuestionsCount,
    int? commentsCount,
    int? activeUsersCount,
  }) {
    _forums = forums;
    _answers = answers;
    _questionsCount = questionsCount;
    _resolvedCount = resolvedCount;
    _openQuestionsCount = openQuestionsCount;
    _commentsCount = commentsCount;
    _activeUsersCount = activeUsersCount;
  }

  List<Forum>? _answers;
  List<Forum>? _forums;
  int? _questionsCount;
  int? _resolvedCount;
  int? _openQuestionsCount;
  int? _commentsCount;
  int? _activeUsersCount;

  List<Forum> get forums => _forums ?? [];

  List<Forum> get answers => _answers ?? [];

  int get questionsCount => _questionsCount ?? 0;

  int get resolvedCount => _resolvedCount ?? 0;

  int get openQuestionsCount => _openQuestionsCount ?? 0;

  int get commentsCount => _commentsCount ?? 0;

  int get activeUsersCount => _activeUsersCount ?? 0;

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      super == other &&
          other is ForumData &&
          runtimeType == other.runtimeType &&
          _forums == other._forums &&
          _questionsCount == other._questionsCount &&
          _resolvedCount == other._resolvedCount &&
          _openQuestionsCount == other._openQuestionsCount &&
          _commentsCount == other._commentsCount &&
          _answers == other._answers &&
          _activeUsersCount == other._activeUsersCount;

  @override
  int get hashCode =>
      super.hashCode ^
      _forums.hashCode ^
      _questionsCount.hashCode ^
      _resolvedCount.hashCode ^
      _openQuestionsCount.hashCode ^
      _commentsCount.hashCode ^
      _answers.hashCode ^
      _activeUsersCount.hashCode;
}
