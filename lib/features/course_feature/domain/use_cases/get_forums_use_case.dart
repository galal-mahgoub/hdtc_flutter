import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/forum_data.dart';
import '../repositories/base_course_repository.dart';

class GetForumsUseCase {
  final BaseCourseRepository baseCourseRepository;

  GetForumsUseCase({required this.baseCourseRepository});

  Future<Either<Failure, ForumData>> call({
    required String courseId,
    required String search,
  }) async {
    return await baseCourseRepository.getForums(
      courseId: courseId,
      search: search,
    );
  }
}
