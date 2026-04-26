import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_course_repository.dart';

class AddCourseReviewUseCase {
  final BaseCourseRepository baseCourseRepository;

  AddCourseReviewUseCase({required this.baseCourseRepository});

  Future<Either<Failure, String>> call({
    required String courseId,
    required String description,
    required double contentQuality,
    required double instructorSkills,
    required double purchaseWorth,
    required double supportQuality,
  }) async {
    return await baseCourseRepository.sendCourseReview(
      courseId: courseId,
      description: description,
      contentQuality: contentQuality,
      instructorSkills: instructorSkills,
      purchaseWorth: purchaseWorth,
      supportQuality: supportQuality,
    );
  }
}
