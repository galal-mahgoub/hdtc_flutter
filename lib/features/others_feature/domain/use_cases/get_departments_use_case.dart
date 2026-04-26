import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/department.dart';
import '../repositories/base_others_repository.dart';

class GetDepartmentUseCase {
  final BaseOthersRepository baseOthersRepository;

  GetDepartmentUseCase({required this.baseOthersRepository});

  Future<Either<Failure, List<Department>>> call() async {
    return await baseOthersRepository.getDepartments();
  }
}
