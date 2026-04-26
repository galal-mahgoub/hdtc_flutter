import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_language_repository.dart';

class GetLanguageUseCase {
  final BaseLanguageRepository baseLanguageRepository;

  GetLanguageUseCase({required this.baseLanguageRepository});

  Future<Either<Failure, String>> call() async {
    return await baseLanguageRepository.getLanguage();
  }
}
