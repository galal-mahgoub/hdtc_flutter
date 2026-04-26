import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/handler.dart';
import '../../domain/repositories/base_language_repository.dart';
import '../data_source/language_remote_data_source.dart';

class LanguageRespoitory implements BaseLanguageRepository {
  final BaseLanguageRemoteDataSource baseLanguageRemoteDataSource;
  final Handler errorHandler;

  LanguageRespoitory({
    required this.baseLanguageRemoteDataSource,
    required this.errorHandler,
  });
  @override
  Future<Either<Failure, String>> getLanguage() async {
    return errorHandler.asyncHandler<String>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      final lang = await baseLanguageLocalDataSource.readLanguage();

      return lang;
    });
  }

  @override
  Future<Either<Failure, Unit>> saveLanguage({required String lang}) async {
    return errorHandler.asyncHandler<Unit>((
      baseAuthLocalDataSource,
      baseLanguageLocalDataSource,
    ) async {
      var token = await baseAuthLocalDataSource.readToken();

      await baseLanguageLocalDataSource.writeLanguage(lang: lang);

      if (token != null) {
        await baseLanguageRemoteDataSource.changeLanguage(
          lang: lang,
          token: token,
        );
      }

      return unit;
    });
  }
}
