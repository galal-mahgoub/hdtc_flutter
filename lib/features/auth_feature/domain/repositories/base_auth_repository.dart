import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/quick_info.dart';
import '../entities/user.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, bool>> getCountry();

  Future<Either<Failure, User>> getUserData();

  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> updateProfile({
    required String name,
    required String mobile,
    required bool newsletter,
    required bool publicMessage,
    required bool supportSignLang,
  });

  Future<Either<Failure, Unit>> logOut();

  Future<Either<Failure, User>> register({
    required String name,
    required String countryCode,
    required String mobile,
    required String email,
    required String password,
    required String passwordConfirmation,
  });

  Future<Either<Failure, User>> verifyCode({
    required String code,
  });

  Future<Either<Failure, Unit>> resendVerifyCode();

  Future<Either<Failure, Unit>> sendForgotPasswordCode({
    required String email,
  });
  Future<Either<Failure, Unit>> verifyForgotPasswordCode({
    required String email,
    required String code,
  });

  Future<Either<Failure, User>> resetForgotPassword({
    required String email,
    required String code,
    required String pass,
    required String confirmPass,
  });

  Future<Either<Failure, Unit>> changePassword({
    required String oldPass,
    required String pass,
    required String confirmPass,
  });

  Future<Either<Failure, QuickInfo>> quickInfo();

  Future<Either<Failure, String>> updateProfileImg({
    required String image,
  });

  Future<Either<Failure, String>> updateLocalization({
    required String countryId,
    required String provinceId,
    required String cityId,
    required String districtId,
    required String timezone,
    required String address,
  });
}
