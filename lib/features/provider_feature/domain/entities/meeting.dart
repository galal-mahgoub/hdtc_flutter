import 'package:equatable/equatable.dart';

import 'timing.dart';

class Meeting extends Equatable {
  final String timeZone;
  final String gmt;
  final int id;
  final bool disabled;
  final dynamic discount;
  final int price;
  final String inPerson;
  final int inPersonPrice;
  final String? inPersonGroupMinStudent;
  final String? inPersonGroupMaxStudent;
  final String? inPersonGroupAmount;
  final String groupMeeting;
  final String? onlineGroupMinStudent;
  final String? onlineGroupMaxStudent;
  final String? onlineGroupAmount;
  final List<Timing> timing;
  final Map<String, List<Timing>> timingGroupByDay;
  final String? priceWithDiscount;
  final int? inPersonPriceWithDiscount;
  final String? inPersonPriceWithDiscountString;

  const Meeting({
    required this.timeZone,
    required this.gmt,
    required this.id,
    required this.disabled,
    required this.discount,
    required this.price,
    required this.inPerson,
    required this.inPersonPrice,
    required this.inPersonGroupMinStudent,
    required this.inPersonGroupMaxStudent,
    required this.inPersonGroupAmount,
    required this.groupMeeting,
    required this.onlineGroupMinStudent,
    required this.onlineGroupMaxStudent,
    required this.onlineGroupAmount,
    required this.timing,
    required this.timingGroupByDay,
    required this.priceWithDiscount,
    required this.inPersonPriceWithDiscount,
    required this.inPersonPriceWithDiscountString,
  });

  @override
  List<Object?> get props => [
        timeZone,
        gmt,
        id,
        disabled,
        discount,
        price,
        inPerson,
        inPersonPrice,
        inPersonGroupMinStudent,
        inPersonGroupMaxStudent,
        inPersonGroupAmount,
        groupMeeting,
        onlineGroupMinStudent,
        onlineGroupMaxStudent,
        onlineGroupAmount,
        timing,
        timingGroupByDay,
        priceWithDiscount,
        inPersonPriceWithDiscount,inPersonPriceWithDiscountString,
      ];
}
