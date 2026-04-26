import 'package:equatable/equatable.dart';

import 'course.dart';
import 'question.dart';
import 'teacher.dart';

class Quiz extends Equatable {
  final int id;
  final String title;
  final String time;
  final String? authStatus;
  final List<Question> questions;
  final int questionCount;
  final int totalMark;
  final String passMark;
  final int averageGrade;
  final int studentCount;
  final int certificatesCount;
  final int successRate;
  final String status;
  final String? attempt;
  final String createdAt;
  final String certificate;
  final Teacher teacher;
  final int? authAttemptCount;
  final String attemptState;
  final bool? authCanStart;
  final Course course;

  const Quiz({
    required this.id,
    required this.title,
    required this.time,
    required this.authStatus,
    required this.questionCount,
    required this.totalMark,
    required this.passMark,
    required this.averageGrade,
    required this.studentCount,
    required this.certificatesCount,
    required this.successRate,
    required this.status,
    required this.attempt,
    required this.createdAt,
    required this.certificate,
    required this.teacher,
    required this.authAttemptCount,
    required this.attemptState,
    required this.authCanStart,
    required this.course,
    required this.questions,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        time,
        authStatus,
        questionCount,
        totalMark,
        passMark,
        averageGrade,
        studentCount,
        certificatesCount,
        successRate,
        status,
        attempt,
        createdAt,
        certificate,
        teacher,
        authAttemptCount,
        attemptState,
        authCanStart,
        course,
        questions,
      ];
}
