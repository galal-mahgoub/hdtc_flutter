import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_course_repository.dart';

class AddReportUseCase {
  final BaseCourseRepository baseCourseRepository;

  AddReportUseCase({required this.baseCourseRepository});

  Future<Either<Failure, String>> call({
    required String courseId,
    required String reason,
    required String message,
  }) async {
    return await baseCourseRepository.addReport(
      courseId: courseId,
      reason: reason,
      message: message,
    );
  }
}
