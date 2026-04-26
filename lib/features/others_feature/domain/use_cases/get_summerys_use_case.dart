import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/summery.dart';
import '../repositories/base_others_repository.dart';

class GetSummaryUseCase {
  final BaseOthersRepository baseOthersRepository;

  GetSummaryUseCase({required this.baseOthersRepository});

  Future<Either<Failure, Summery>> call() async {
    return await baseOthersRepository.getSummarys();
  }
}
