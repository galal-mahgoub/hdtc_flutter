import 'package:hdtc_on/features/provider_feature/data/models/provider_model.dart';

import '../../domain/entities/last_answer.dart';

class LastAnswerModel extends LastAnswer {
  LastAnswerModel({
    required super.description,
    required super.user,
  });

  factory LastAnswerModel.fromJson(Map<String, dynamic> json) {
    return LastAnswerModel(
      description: json['description'],
      user: json['user'] != null ? ProviderModel.fromJson(json['user']) : null,
    );
  }
}
