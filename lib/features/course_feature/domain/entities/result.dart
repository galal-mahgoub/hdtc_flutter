// ignore_for_file: non_nullable_equals_parameter

import '../../../provider_feature/domain/entities/provider.dart';
import 'course.dart';
import 'quiz.dart';
import 'quiz_review.dart';

class Result {
  Result({
    int? id,
    Quiz? quiz,
    Course? webinar,
    Provider? user,
    int? userGrade,
    String? status,
    int? createdAt,
    bool? authCanTryAgain,
    // int? countTryAgain,
    bool? reviewable,
    List<QuizReview>? quizReview,
  }) {
    _id = id.toString();
    _quiz = quiz;
    _webinar = webinar;
    _user = user;
    _userGrade = userGrade;
    _status = status;
    _createdAt = createdAt;
    _authCanTryAgain = authCanTryAgain;
    // _countTryAgain = countTryAgain;
    _reviewable = reviewable;
    _quizReview = quizReview;
  }

  String? _id;
  Quiz? _quiz;
  Course? _webinar;
  Provider? _user;
  int? _userGrade;
  String? _status;
  int? _createdAt;
  bool? _authCanTryAgain;
  // int? _countTryAgain;
  bool? _reviewable;
  List<QuizReview>? _quizReview;

  String get id => _id ?? '';
  Quiz? get quiz => _quiz;

  Course? get webinar => _webinar;

  Provider? get user => _user;

  int get userGrade => _userGrade ?? 0;

  String get status => _status ?? '';

  int get createdAt => _createdAt ?? 0;

  bool get authCanTryAgain => _authCanTryAgain ?? false;

  // int get countTryAgain => _countTryAgain ?? 0;

  bool get reviewable => _reviewable ?? false;

  List<QuizReview> get quizReview => _quizReview ?? [];

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      super == other &&
          other is Result &&
          runtimeType == other.runtimeType &&
          _quiz == other._quiz &&
          _webinar == other._webinar &&
          _user == other._user &&
          _userGrade == other._userGrade &&
          _status == other._status &&
          _createdAt == other._createdAt &&
          _authCanTryAgain == other._authCanTryAgain &&
          // _countTryAgain == other._countTryAgain &&
          _reviewable == other._reviewable &&
          _quizReview == other._quizReview;

  @override
  int get hashCode =>
      super.hashCode ^
      _quiz.hashCode ^
      _webinar.hashCode ^
      _user.hashCode ^
      _userGrade.hashCode ^
      _status.hashCode ^
      _createdAt.hashCode ^
      _authCanTryAgain.hashCode ^
      // _countTryAgain.hashCode ^
      _reviewable.hashCode ^
      _quizReview.hashCode;
}
