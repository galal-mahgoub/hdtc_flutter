import '../../domain/entities/quiz.dart';
import 'course_model.dart';
import 'question_model.dart';
import 'teacher_model.dart';

class QuizModel extends Quiz {
  const QuizModel({
    required super.id,
    required super.title,
    required super.time,
    required super.authStatus,
    required super.questionCount,
    required super.totalMark,
    required super.passMark,
    required super.averageGrade,
    required super.studentCount,
    required super.certificatesCount,
    required super.successRate,
    required super.status,
    required super.attempt,
    required super.createdAt,
    required super.certificate,
    required super.teacher,
    required super.authAttemptCount,
    required super.attemptState,
    required super.authCanStart,
    required super.course,
    required super.questions,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      id: json['id'],
      title: json['title'],
      time: json['time']?.toString() ?? '0',
      authStatus: json['auth_status'],
      questionCount: json['question_count'],
      totalMark: json['total_mark'],
      passMark: json['pass_mark'].toString(),
      averageGrade: int.tryParse(json['average_grade'].toString()) ?? 0,
      studentCount: json['student_count'],
      certificatesCount: json['certificates_count'],
      successRate: json['success_rate'],
      status: json['status'],
      attempt: json['attempt']?.toString(),
      createdAt: json['created_at'].toString(),
      certificate: json['certificate'].toString(),
      teacher: TeacherModel.fromJson(json['teacher']),
      authAttemptCount: json['auth_attempt_count'],
      attemptState: json['attempt_state'],
      authCanStart: json['auth_can_start'],
      course: CourseModel.fromJson(json['webinar']),
      questions: json['questions'] == null
          ? []
          : List.from(json['questions'])
              .map((e) => QuestionModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'time': time,
      'auth_status': authStatus,
      'question_count': questionCount,
      'total_mark': totalMark,
      'pass_mark': passMark,
      'average_grade': averageGrade,
      'student_count': studentCount,
      'certificates_count': certificatesCount,
      'success_rate': successRate,
      'status': status,
      'attempt': attempt,
      'created_at': createdAt,
      'certificate': certificate,
      'teacher': (teacher as TeacherModel).toJson(),
      'auth_attempt_count': authAttemptCount,
      'attempt_state': attemptState,
      'auth_can_start': authCanStart,
      'webinar': (course as CourseModel).toJson(),
    };
  }
}
