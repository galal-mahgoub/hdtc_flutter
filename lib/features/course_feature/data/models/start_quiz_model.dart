import '../../domain/entities/start_quiz.dart';
import 'quiz_model.dart';

class StartQuizModel extends StartQuiz {
  StartQuizModel({
    required super.quizResultId,
    required super.quiz,
  });

  factory StartQuizModel.fromJson(Map<String, dynamic> json) {
    return StartQuizModel(
      quizResultId: json['quiz_result_id'],
      quiz: json['quiz'] == null ? null : QuizModel.fromJson(json['quiz']),
    );
  }
}
