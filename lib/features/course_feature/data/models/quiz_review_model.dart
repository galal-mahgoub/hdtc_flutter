import '../../domain/entities/quiz_review.dart';

class QuizReviewModel extends QuizReview {
  QuizReviewModel({
    required super.id,
    required super.title,
    required super.type,
    required super.grade,
    required super.createdAt,
    required super.answers,
    required super.userAnswer,
    required super.multipleCorrectAnswer,
  });

  factory QuizReviewModel.fromJson(Map<String, dynamic> json) {
    return QuizReviewModel(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      grade: json['grade'],
      answers: json['answers'] == null
          ? null
          : List.from(json['answers'])
              .map((e) => AnswerModel.fromJson(e))
              .toList(),
      userAnswer: json['user_answer'] == null
          ? null
          : UserAnswerModel.fromJson(json['user_answer']),
      multipleCorrectAnswer: json['multiple_correct_answer'] == null
          ? null
          : MultipleCorrectAnswerModel.fromJson(
              json['multiple_correct_answer']),
      createdAt: int.tryParse(json['created_at'].toString()),
    );
  }
}

class AnswerModel extends Answer {
  AnswerModel({
    required super.id,
    required super.title,
    required super.correct,
    required super.image,
    required super.createdAt,
  });

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      correct: int.tryParse(json['correct'].toString()),
      createdAt: int.tryParse(json['created_at'].toString()),
    );
  }
}

class UserAnswerModel extends UserAnswer {
  UserAnswerModel({
    required super.grade,
    required super.status,
    required super.answer,
  });

  factory UserAnswerModel.fromJson(Map<String, dynamic> json) {
    return UserAnswerModel(
      grade: json['grade'],
      status: json['status'],
      answer: json['answer'],
    );
  }
}

class MultipleCorrectAnswerModel extends MultipleCorrectAnswer {
  MultipleCorrectAnswerModel({
    required super.id,
    required super.title,
    required super.correct,
    required super.image,
    required super.createdAt,
  });

  factory MultipleCorrectAnswerModel.fromJson(Map<String, dynamic> json) {
    return MultipleCorrectAnswerModel(
      id: json['id'],
      title: json['title'],
      correct: int.tryParse(json['correct'].toString()),
      image: json['image'],
      createdAt: int.tryParse(json['created_at'].toString()),
    );
  }
}
