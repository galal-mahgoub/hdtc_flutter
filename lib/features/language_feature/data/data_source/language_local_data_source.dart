import 'package:dartz/dartz.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/consts/enums.dart';
import '../../../../core/consts/k_strings.dart';
import '../../../../core/errors/exceptions.dart';

abstract class BaseLanguageLocalDataSource {
  Future<String> readLanguage();
  Future<Unit> writeLanguage({required String lang});
}

class LanguageLocalDataSource implements BaseLanguageLocalDataSource {
  final GetStorage getStorage;
  LanguageLocalDataSource({required this.getStorage});

  @override
  Future<String> readLanguage() async {
    final data = await getStorage.read(Kstrings.langStorage);

    if (data != null) {
      return Future.value(data);
    } else {
      return Future.value(Language.en.name);
    }
  }

  @override
  Future<Unit> writeLanguage({required String lang}) async {
    try {
      await getStorage.write(Kstrings.langStorage, lang);
      return Future.value(unit);
    } catch (e) {
      throw EmptyCacheException();
    }
  }
}
