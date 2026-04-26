import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_course_repository.dart';

class AddCourseFreeUseCase {
  final BaseCourseRepository baseCourseRepository;

  AddCourseFreeUseCase({required this.baseCourseRepository});

  Future<Either<Failure, String>> call({
    required String courseId,

  }) async {
    return await baseCourseRepository.addCourseFree(
      courseId: courseId,
    
    );
  }
}
