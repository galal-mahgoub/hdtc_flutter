class QuizReview {
  QuizReview({
    int? id,
    String? title,
    String? type,
    String? grade,
    int? createdAt,
    List<Answer>? answers,
    UserAnswer? userAnswer,
    MultipleCorrectAnswer? multipleCorrectAnswer,
  }) {
    _id = id.toString();
    _title = title;
    _type = type;
    _grade = grade;
    _createdAt = createdAt;
    _answers = answers;
    _userAnswer = userAnswer;
    _multipleCorrectAnswer = multipleCorrectAnswer;
  }

  String? _id;
  String? _title;
  String? _type;
  String? _grade;
  int? _createdAt;
  List<Answer>? _answers;
  UserAnswer? _userAnswer;
  MultipleCorrectAnswer? _multipleCorrectAnswer;

  String get id => _id ?? '';

  String get title => _title ?? '';

  String get type => _type ?? '';

  String get grade => _grade ?? '';

  int get createdAt => _createdAt ?? 0;

  List<Answer> get answers => _answers ?? [];

  UserAnswer get userAnswer => _userAnswer ?? UserAnswer();

  MultipleCorrectAnswer get multipleCorrectAnswer =>
      _multipleCorrectAnswer ?? MultipleCorrectAnswer();
}

class Answer {
  Answer({
    int? id,
    String? title,
    int? correct,
    String? image,
    int? createdAt,
  }) {
    _id = id.toString();
    _title = title;
    _correct = correct;
    _image = image;
    _createdAt = createdAt;
  }

  String? _id;
  String? _title;
  int? _correct;
  String? _image;
  int? _createdAt;

  String get id => _id ?? '';

  String get title => _title ?? '';

  int get correct => _correct ?? 0;

  String get image => _image ?? '';

  int get createdAt => _createdAt ?? 0;
}

class UserAnswer {
  UserAnswer({
    String? grade,
    bool? status,
    String? answer,
  }) {
    _grade = grade;
    _status = status;
    _answer = answer;
  }

  String? _grade;
  bool? _status;
  String? _answer;

  String get grade => _grade ?? '';

  bool get status => _status ?? false;

  String get answer => _answer ?? '';
}

class MultipleCorrectAnswer {
  MultipleCorrectAnswer({
    int? id,
    String? title,
    int? correct,
    String? image,
    int? createdAt,
  }) {
    _id = id.toString();
    _title = title;
    _correct = correct;
    _image = image;
    _createdAt = createdAt;
  }

  String? _id;
  String? _title;
  int? _correct;
  String? _image;
  int? _createdAt;

  String get id => _id ?? '';

  String get title => _title ?? '';

  int get correct => _correct ?? 0;

  String get image => _image ?? '';

  int get createdAt => _createdAt ?? 0;
}
