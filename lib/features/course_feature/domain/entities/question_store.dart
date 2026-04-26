class QuestionStore {
  QuestionStore({
    String? idQuestion,
    String? idAnswer,
    String? value,
    String? grade,
    int? index,
  }) {
    _idQuestion = idQuestion.toString();
    _idAnswer = idAnswer;
    _value = value;
    _grade = grade;
    _index = index;
  }

  String? _idQuestion;
  String? _idAnswer;
  String? _value;
  String? _grade;
  int? _index;

  String get idQuestion => _idQuestion ?? '';

  String get idAnswer => _idAnswer ?? '';

  String get value => _value ?? '';

  String get grade => _grade ?? '';

  int get index => _index ?? -1;

  @override
  String toString() {
    return 'QuestionStoreModel{_idQuestion: $_idQuestion, _idAnswer: $_idAnswer, _value: $_value, _grade: $_grade, index: $_index}';
  }

  Map<String, dynamic> toJsonCreate() {
    final map = <String, dynamic>{};
    map['question_id'] = idQuestion;
    map['answer'] = idAnswer;
    return map;
  }
}
