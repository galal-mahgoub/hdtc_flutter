import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_course_repository.dart';

class AddQuestionUseCase {
  final BaseCourseRepository baseCourseRepository;

  AddQuestionUseCase({required this.baseCourseRepository});

  Future<Either<Failure, String>> call({
    required String courseId,
    required String title,
    required String description,
  }) async {
    return await baseCourseRepository.addQuestion(
      courseId: courseId,
      title: title,
      description: description,
    );
  }
}
