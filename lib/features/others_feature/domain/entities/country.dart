import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String id;
  final String? type;
  final String title;
  final int? createdAt;

  const Country({
    required this.id,
    this.type,
    required this.title,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        title,
        createdAt,
      ];
}
