import 'package:equatable/equatable.dart';

class Can extends Equatable {
  final bool view;

  const Can({
    required this.view,
  });

  @override
  List<Object?> get props => [view];
}
