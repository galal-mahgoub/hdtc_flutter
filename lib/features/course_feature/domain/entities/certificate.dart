import 'package:equatable/equatable.dart';

import 'course.dart';
import 'teacher.dart';

class Certificate extends Equatable {
  final int id;
  final String? title;
  final String? time;
  final String? authStatus;
  final int? questionCount;
  final int? totalMark;
  final String? passMark;
  final int? averageGrade;
  final int? studentCount;
  final int? certificatesCount;
  final int? successRate;
  final String? status;
  final String? attempt;
  final String? createdAt;
  final dynamic certificate;
  final int? authAttemptCount;
  final String? attemptState;
  final bool? authCanStart;
  final Course? course;
  final Teacher? teacher;

  const Certificate({
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
    required this.authAttemptCount,
    required this.attemptState,
    required this.authCanStart,
    required this.course,
    required this.teacher,
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
        authAttemptCount,
        attemptState,
        authCanStart,
        course,
        teacher,
      ];
}

class UserCertificate extends Equatable {
  final int id;
  final int userGrade;
  final dynamic file;
  final int createdAt;

  const UserCertificate({
    required this.id,
    required this.userGrade,
    required this.file,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, userGrade, file, createdAt];
}
