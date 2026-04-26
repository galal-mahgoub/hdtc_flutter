import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../consts/enums.dart';

extension DateTimeExtensions on DateTime? {
  String get appDateFormat {
    if (this == null) {
      return '';
    }

    return DateFormat(
      'M/d/yyyy',
      Get.locale!.languageCode == Language.ar.name
          ? Language.ar.name
          : Language.en.name,
    ).format(this!);
  }

  String get appTimeFormat {
    if (this == null) {
      return '';
    }

    return DateFormat.Hm().format(this!);
  }
}

// extension DoubleExtensions on num {
//   double get sp {
//     return (this * (Get.width / kWidth));
//   }

//   double get w {
//     return this * (Get.width / kWidth);
//   }

//   double get h {
//     return this * (Get.height / kHeight);
//   }

//   double get r {
//     return this * min((Get.width / kWidth), Get.height / kHeight);
//   }

//   SizedBox get verticalSpace {
//     return SizedBox(height: this * (Get.height / kHeight));
//   }

//   SizedBox get horizontalSpace {
//     return SizedBox(width: this * (Get.width / kWidth));
//   }
// }

// extension EdgeInsetsExtension on EdgeInsets {
//   /// Creates adapt insets using r [SizeExtension].
//   EdgeInsets get r => copyWith(
//         top: top.r,
//         bottom: bottom.r,
//         right: right.r,
//         left: left.r,
//       );

//   EdgeInsets get w => copyWith(
//         top: top.w,
//         bottom: bottom.w,
//         right: right.w,
//         left: left.w,
//       );

//   EdgeInsets get h => copyWith(
//         top: top.h,
//         bottom: bottom.h,
//         right: right.h,
//         left: left.h,
//       );

//   EdgeInsets get p => copyWith(
//         top: top.h,
//         bottom: bottom.h,
//         right: right.w,
//         left: left.w,
//       );
// }
