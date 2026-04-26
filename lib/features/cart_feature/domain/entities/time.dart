import 'package:equatable/equatable.dart';

class Time extends Equatable {
  final String start;
  final String end;

  const Time({
    required this.start,
    required this.end,
  });

  @override
  List<Object?> get props => [
        start,
        end,
      ];
}
