import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_course_repository.dart';

class EditQuestionUseCase {
  final BaseCourseRepository baseCourseRepository;

  EditQuestionUseCase({required this.baseCourseRepository});

  Future<Either<Failure, String>> call({
    required String courseId,
    required String title,
    required String description,
  }) async {
    return await baseCourseRepository.editQuestion(
      courseId: courseId,
      title: title,
      description: description,
    );
  }
}
