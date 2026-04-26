import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/course.dart';
import '../repositories/base_course_repository.dart';

class GetPurchasesCoursesUseCase {
  final BaseCourseRepository baseCourseRepository;

  GetPurchasesCoursesUseCase({required this.baseCourseRepository});

  Future<Either<Failure, List<Course>>> call() async {
    return await baseCourseRepository.getPurchasesCourses();
  }
}
