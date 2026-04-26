import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_course_repository.dart';

class GetReasonsUseCase {
  final BaseCourseRepository baseCourseRepository;

  GetReasonsUseCase({required this.baseCourseRepository});

  Future<Either<Failure, List<String>>> call() async {
    return await baseCourseRepository.getReasons();
  }
}
