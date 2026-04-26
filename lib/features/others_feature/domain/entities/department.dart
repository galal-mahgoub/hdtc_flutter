import 'package:equatable/equatable.dart';

class Department extends Equatable {
  final int id;
  final String title;

  const Department({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}
