import 'package:equatable/equatable.dart';

class Tag extends Equatable {
  final int id;
  final String title;

  const Tag({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}
