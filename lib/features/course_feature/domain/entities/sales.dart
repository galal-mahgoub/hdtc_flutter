import 'package:equatable/equatable.dart';

class Sales extends Equatable {
  final int count;
  final int amount;

  const Sales({
    required this.count,
    required this.amount,
  });

  @override
  List<Object?> get props => [count, amount];
}
