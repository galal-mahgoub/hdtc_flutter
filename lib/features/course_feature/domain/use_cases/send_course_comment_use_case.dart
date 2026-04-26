import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_course_repository.dart';

class SendCourseCommentUseCase {
  final BaseCourseRepository baseCourseRepository;

  SendCourseCommentUseCase({required this.baseCourseRepository});

  Future<Either<Failure, String>> call({
    required String courseId,
    required String comment,
    required String itemName,
  }) async {
    return await baseCourseRepository.sendCourseComment(
      courseId: courseId,
      comment: comment,
      itemName: itemName,
    );
  }
}
