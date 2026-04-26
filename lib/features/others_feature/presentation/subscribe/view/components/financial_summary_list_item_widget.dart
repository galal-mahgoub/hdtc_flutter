import 'package:get/get.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../../domain/entities/transaction.dart';

class FinancialSummaryListItemWidget extends StatelessWidget {
  const FinancialSummaryListItemWidget({
    super.key,
    required this.item,
  });
  final Transaction item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(
        horizontal: 10.r,
        vertical: 10.r,
      ),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(13.r),
            decoration: BoxDecoration(
              color: item.balanceType == "deduction"
                  ? ColorManager.orange
                  : context.theme.primaryColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: item.balanceType == "deduction"
                ? Icon(
                    Icons.keyboard_arrow_down,
                    size: 25.sp,
                    color: ColorManager.white,
                  )
                : Icon(
                    Icons.keyboard_arrow_up,
                    size: 25.sp,
                    color: ColorManager.white,
                  ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.description,
                maxLines: 1,
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 13.sp,
                    color: ColorManager.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 7.h,
              ),
              Row(
                children: [
                  Text(
                    DateFormat('dd MMM yyyy | HH:mm',
                            GetStorage().read<String>('language_code') ?? 'EN')
                        .format(DateTime.fromMillisecondsSinceEpoch(
                            int.parse(item.createdAt) * 1000)),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorManager.grey5,
                    ),
                  ),
                  Text(
                    '${item.balanceType == "deduction" ? '-' : '+'} ${item.amountString}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: item.balanceType == "deduction"
                          ? ColorManager.red
                          : context.theme.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
