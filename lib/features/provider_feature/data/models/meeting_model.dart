import 'timing_model.dart';
import '../../domain/entities/meeting.dart';

class MeetingModel extends Meeting {
  const MeetingModel({
    required super.timeZone,
    required super.gmt,
    required super.id,
    required super.disabled,
    required super.discount,
    required super.price,
    required super.inPerson,
    required super.inPersonPrice,
    required super.inPersonGroupMinStudent,
    required super.inPersonGroupMaxStudent,
    required super.inPersonGroupAmount,
    required super.groupMeeting,
    required super.onlineGroupMinStudent,
    required super.onlineGroupMaxStudent,
    required super.onlineGroupAmount,
    required super.timing,
    required super.timingGroupByDay,
    required super.priceWithDiscount,
    required super.inPersonPriceWithDiscount,
    required super.inPersonPriceWithDiscountString,
  });

  factory MeetingModel.fromJson(Map<String, dynamic> json) {
    final timingList = json['timing'] as List;
    final timingGroupByDay =
        json['timing_group_by_day'] as Map<String, dynamic>;
    return MeetingModel(
      timeZone: json['time_zone'],
      gmt: json['gmt'],
      id: json['id'],
      disabled: json['disabled'] == "1",
      discount: json['discount'],
      price: json['price'],
      inPerson: json['in_person'].toString(),
      inPersonPriceWithDiscount: json["in_person_price_with_discount"],
      inPersonPrice: json['in_person_price'],
      inPersonGroupMinStudent: json['in_person_group_min_student']?.toString(),
      inPersonGroupMaxStudent: json['in_person_group_max_student']?.toString(),
      inPersonGroupAmount: json['in_person_group_amount']?.toString(),
      groupMeeting: json['group_meeting'].toString(),
      onlineGroupMinStudent: json['online_group_min_student']?.toString(),
      onlineGroupMaxStudent: json['online_group_max_student']?.toString(),
      onlineGroupAmount: json['online_group_amount']?.toString(),
      timing: timingList.map((timing) => TimingModel.fromJson(timing)).toList(),
      timingGroupByDay: timingGroupByDay.map((key, value) {
        return MapEntry(
            key,
            List<TimingModel>.from(
                value.map((timing) => TimingModel.fromJson(timing))));
      }),
      priceWithDiscount: json['price_with_discount']?.toString(),
      inPersonPriceWithDiscountString:
          json['in_person_price_with_discount_string'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timeZone'] = timeZone;
    data['gmt'] = gmt;
    data['id'] = id;
    data['disabled'] = disabled;
    data['discount'] = discount;
    data['price'] = price;
    data['inPerson'] = inPerson;
    data['inPersonPrice'] = inPersonPrice;
    data['inPersonGroupMinStudent'] = inPersonGroupMinStudent;
    data['inPersonGroupMaxStudent'] = inPersonGroupMaxStudent;
    data['inPersonGroupAmount'] = inPersonGroupAmount;
    data['groupMeeting'] = groupMeeting;
    data['onlineGroupMinStudent'] = onlineGroupMinStudent;
    data['onlineGroupMaxStudent'] = onlineGroupMaxStudent;
    data['onlineGroupAmount'] = onlineGroupAmount;
    data['in_person_price_with_discount_string'] =
        inPersonPriceWithDiscountString;
    data['timing'] =
        timing.map((timing) => (timing as TimingModel).toJson()).toList();
    data['timingGroupByDay'] = timingGroupByDay.map((key, value) => MapEntry(
        key, value.map((timing) => (timing as TimingModel).toJson()).toList()));
    data['priceWithDiscount'] = priceWithDiscount;
    return data;
  }
}
