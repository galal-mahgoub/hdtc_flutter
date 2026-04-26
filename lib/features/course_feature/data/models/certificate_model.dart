import '../../domain/entities/certificate.dart';
import 'course_model.dart';
import 'teacher_model.dart';

class CertificateModel extends Certificate {
  const CertificateModel({
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
    required super.authAttemptCount,
    required super.attemptState,
    required super.authCanStart,
    required super.course,
    required super.teacher,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) {
    return CertificateModel(
      id: json['id'],
      title: json['title'],
      time: json['time'].toString(),
      authStatus: json['auth_status'],
      questionCount: json['question_count'],
      totalMark: json['total_mark'],
      passMark: json['pass_mark'].toString(),
      averageGrade: json['average_grade'],
      studentCount: json['student_count'],
      certificatesCount: json['certificates_count'],
      successRate: json['success_rate'],
      status: json['status'],
      attempt: json['attempt'].toString(),
      createdAt: json['created_at']?.toString(),
      certificate: json['certificate'] == null
          ? null
          : json['certificate'] is String || json['certificate'] is int
              ? json['certificate']
              : UserCertificateModel.fromJson(json['certificate']),
      authAttemptCount: json['auth_attempt_count'],
      attemptState: json['attempt_state'],
      authCanStart: json['auth_can_start'],
      course: json['webinar'] == null
          ? null
          : CourseModel.fromJson(json['webinar']),
      teacher: json['teacher'] == null
          ? null
          : TeacherModel.fromJson(json['teacher']),
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
      'auth_attempt_count': authAttemptCount,
      'attempt_state': attemptState,
      'auth_can_start': authCanStart,
    };
  }
}

class UserCertificateModel extends UserCertificate {
  const UserCertificateModel({
    required super.id,
    required super.userGrade,
    required super.file,
    required super.createdAt,
  });

  factory UserCertificateModel.fromJson(Map<String, dynamic> json) {
    return UserCertificateModel(
      id: json['id'],
      userGrade: json['user_grade'],
      file: json['file'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_grade': userGrade,
      'file': file,
      'created_at': createdAt,
    };
  }
}
