import '../../domain/entities/question.dart';
import 'quiz_review_model.dart';

// ignore: must_be_immutable
class QuestionModel extends Question {
  QuestionModel({
    required super.id,
    required super.title,
    required super.type,
    required super.grade,
    required super.createdAt,
    required super.answers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      grade: json['grade'],
      answers: json['answers'] == null
          ? null
          : List.from(json['answers'])
              .map((e) => AnswerModel.fromJson(e))
              .toList(),
      createdAt: int.tryParse(json['created_at'].toString()),
    );
  }
}
