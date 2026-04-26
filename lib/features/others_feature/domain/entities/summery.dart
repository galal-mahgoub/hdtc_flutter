import 'package:equatable/equatable.dart';

import 'transaction.dart';

class Summery extends Equatable {
  final double balance;
  final List<Transaction> history;

  const Summery({
    required this.balance,
    required this.history,
  });

  @override
  List<Object?> get props {
    return [
      balance,
      history,
    ];
  }
}
