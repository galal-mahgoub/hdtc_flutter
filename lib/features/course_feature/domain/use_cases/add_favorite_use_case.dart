import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_course_repository.dart';

class AddFavoriteUseCase {
  final BaseCourseRepository baseCourseRepository;

  AddFavoriteUseCase({required this.baseCourseRepository});

  Future<Either<Failure, Unit>> call({
    required String courseId,
  }) async {
    return await baseCourseRepository.addFavourite(
      courseId: courseId,
    );
  }
}
