import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/services/user_service.dart';
import '../../../../domain/entities/faq.dart';

class FaqsWidget extends StatelessWidget {
  const FaqsWidget({
    super.key,
    required this.faq,
  });

  final Faq faq;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.r),
      child: ExpansionTile(
        backgroundColor: ColorManager.white,
        collapsedBackgroundColor: ColorManager.white,
        childrenPadding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            side: BorderSide.none // Adjust the border radius
            ),
        collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            side: BorderSide.none // Adjust the border radius
            ),
        title: Row(
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              padding: EdgeInsets.all(7.r),
              decoration: BoxDecoration(
                color: UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: Icon(
                Icons.question_mark,
                color: ColorManager.white,
                size: 20.sp,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Text(
                faq.title,
                style: TextStyle(
                    fontSize: 13.sp,
                    color: ColorManager.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        children: [
          Text(
            faq.answer,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 11.sp,
              color: ColorManager.grey9,
            ),
          ),
        ],
      ),
    );
  }
}
