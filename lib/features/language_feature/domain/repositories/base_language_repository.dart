import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class BaseLanguageRepository {
  Future<Either<Failure, Unit>> saveLanguage({required String lang});

  Future<Either<Failure, String>> getLanguage();
}
