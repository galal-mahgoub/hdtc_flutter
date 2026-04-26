import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_course_repository.dart';

class ReadLessonUseCase {
  final BaseCourseRepository baseCourseRepository;

  ReadLessonUseCase({required this.baseCourseRepository});

  Future<Either<Failure, String>> call({
    required String courseId,
    required String itemId,
    required bool status,

  }) async {
    return await baseCourseRepository.readLesson(
      courseId: courseId,
      itemId: itemId,
      status: status,
    
    );
  }
}
