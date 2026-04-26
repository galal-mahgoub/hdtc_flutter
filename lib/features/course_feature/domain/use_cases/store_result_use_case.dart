import 'package:dartz/dartz.dart';
import 'package:hdtc_on/features/course_feature/domain/entities/question_store.dart';

import '../../../../core/errors/failures.dart';
import '../entities/result.dart';
import '../repositories/base_course_repository.dart';

class StoreResultUseCase {
  final BaseCourseRepository baseCourseRepository;

  StoreResultUseCase({required this.baseCourseRepository});

  Future<Either<Failure, Result>> call({
    required String quizId,
    required String quizResultId,
    required List<QuestionStore> answers,
  }) async {
    return await baseCourseRepository.storeResult(
      quizId: quizId,
      quizResultId: quizResultId,
      answers: answers,
    );
  }
}
