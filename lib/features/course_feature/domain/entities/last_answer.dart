import 'package:hdtc_on/features/provider_feature/domain/entities/provider.dart';

class LastAnswer {
  LastAnswer({
    String? description,
    Provider? user,
  }) {
    _description = description;
    _user = user;
  }

  String? _description;
  Provider? _user;

  String? get description => _description;

  Provider? get user => _user;
}
