import 'package:equatable/equatable.dart';

class RateType extends Equatable {
  final double contentQuality;
  final double instructorSkills;
  final double purchaseWorth;
  final double supportQuality;

  const RateType({
    required this.contentQuality,
    required this.instructorSkills,
    required this.purchaseWorth,
    required this.supportQuality,
  });

  @override
  List<Object?> get props => [
        contentQuality,
        instructorSkills,
        purchaseWorth,
        supportQuality,
      ];
}
