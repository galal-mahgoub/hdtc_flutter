import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/base_language_repository.dart';

class SaveLanguageUseCase {
  final BaseLanguageRepository baseLanguageRepository;

  SaveLanguageUseCase({required this.baseLanguageRepository});

  Future<Either<Failure, Unit>> call({required String lang}) async {
    return await baseLanguageRepository.saveLanguage(lang: lang);
  }
}
