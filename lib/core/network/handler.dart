import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../features/auth_feature/data/data_source/auth_local_data_source.dart';
import '../../features/language_feature/data/data_source/language_local_data_source.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';
import '../languages/app_translations.dart';
import '../network/network_info.dart';

class Handler {
  final BaseAuthLocalDataSource baseAuthLocalDataSource;
  final BaseLanguageLocalDataSource baseLanguageLocalDataSource;
  final NetworkInfo networkInfo;

  Handler({
    required this.baseAuthLocalDataSource,
    required this.baseLanguageLocalDataSource,
    required this.networkInfo,
  });
  Future<Either<Failure, T>> asyncHandler<T>(
    Function(
      BaseAuthLocalDataSource baseAuthLocalDataSource,
      BaseLanguageLocalDataSource baseLanguageLocalDataSource,
    ) function,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        var result = await function(
          baseAuthLocalDataSource,
          baseLanguageLocalDataSource,
        );

        return Right(result);
      } on AuthException catch (error) {
        return Left(AuthFailure(message: error.message));
      } on ValidationException catch (error) {
        return Left(ValidationFailure(message: error.message));
      } on UnAuthenticatedException catch (error) {
        await baseAuthLocalDataSource.removeUser();
        await baseAuthLocalDataSource.removeToken();

        return Left(UnAuthenticatedFailure(message: error.message));
      } on UnExpectedException {
        return Left(UnExpectedFailure(message: LocaleKeys.unExpectedError.tr));
      } on UnVerifiedException catch (error) {
        return Left(UnVerifiedFailure(message: error.message));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure(message: LocaleKeys.networkFailure.tr));
    }
  }

  static dynamic responeHandler<T>(Response response, T successReturn) {
   
    switch (response.statusCode) {
      case 200:
        if (response.body is Map &&
            (response.body as Map).containsKey('success')) {
          if (response.body['success']) {
            return successReturn;
          } else {
            throw ValidationException(message: response.body['message']);
          }
        } else {
          return successReturn;
        }

      case 401:
        throw UnAuthenticatedException(message: LocaleKeys.unAuthMessage.tr);

      case 403:
        throw UnVerifiedException(message: response.body['message']);

      case 400:
      case 422:
      case 404:
      case 419:
      case 500:
        throw ValidationException(message: response.body['message']);
      default:
        throw ServerException();
    }
  }
}
