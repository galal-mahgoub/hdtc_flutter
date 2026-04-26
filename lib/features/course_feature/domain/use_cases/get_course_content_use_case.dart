import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/content.dart';
import '../repositories/base_course_repository.dart';

class GetCourseContentUseCase {
  final BaseCourseRepository baseCourseRepository;

  GetCourseContentUseCase({required this.baseCourseRepository});

  Future<Either<Failure, List<Content>>> call({
    required String courseId,
  }) async {
    return await baseCourseRepository.getCourseContent(
      courseId: courseId,
   
    );
  }
}
