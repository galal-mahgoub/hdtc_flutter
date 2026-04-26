import '../../domain/entities/summery.dart';
import 'transaction_model.dart';

class SummeryModel extends Summery {
  const SummeryModel({
    required super.balance,
    required super.history,
  });

  factory SummeryModel.fromJson(Map<String, dynamic> json) {
    return SummeryModel(
      balance: double.parse(json["balance"].toString()),
      history: List.from(json["history"])
          .map(
            (e) => TransactionModel.fromJson(e),
          )
          .toList(),
    );
  }
}
