import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/result.dart';
import '../repositories/base_course_repository.dart';

class GetQuizResultUseCase {
  final BaseCourseRepository baseCourseRepository;

  GetQuizResultUseCase({required this.baseCourseRepository});

  Future<Either<Failure, Result>> call({
    required String quizId,
  }) async {
    return await baseCourseRepository.getQuizResult(
      quizId: quizId,
    );
  }
}
