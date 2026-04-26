import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_others_repository.dart';

class GetTimeZonesUseCase {
  final BaseOthersRepository baseOthersRepository;

  GetTimeZonesUseCase({required this.baseOthersRepository});

  Future<Either<Failure, List<String>>> call() async {
    return await baseOthersRepository.getTimezones();
  }
}
