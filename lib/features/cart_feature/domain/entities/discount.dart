import 'package:equatable/equatable.dart';

class Discount extends Equatable {
  final int id;

  const Discount({
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
