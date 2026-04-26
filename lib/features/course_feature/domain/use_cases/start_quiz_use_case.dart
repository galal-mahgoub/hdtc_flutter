import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/start_quiz.dart';
import '../repositories/base_course_repository.dart';

class StartQuizUseCase {
  final BaseCourseRepository baseCourseRepository;

  StartQuizUseCase({required this.baseCourseRepository});

  Future<Either<Failure, StartQuiz>> call({
    required String quizId,
  }) async {
    return await baseCourseRepository.startQuiz(
      quizId: quizId,
    );
  }
}
