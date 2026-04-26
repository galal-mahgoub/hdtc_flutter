import 'quiz.dart';

class StartQuiz {
  StartQuiz({
    int? quizResultId,
    Quiz? quiz,
  }) {
    _quizResultId = quizResultId;
    _quizzes = quiz;
  }

  int? _quizResultId;
  Quiz? _quizzes;

  int? get quizResultId => _quizResultId;

  Quiz? get quiz => _quizzes;
}
