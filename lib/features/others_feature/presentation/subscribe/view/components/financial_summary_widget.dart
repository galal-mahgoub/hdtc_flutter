import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/widgets/empty_widget.dart';
import '../../controllers/subscribes_controller.dart';
import 'financial_summary_list_item_widget.dart';

class FinancialSummaryWidget extends StatelessWidget {
  const FinancialSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscribesController>(
      builder: (controller) {
        return controller.summery == null ||
                (controller.summery?.history ?? []).isEmpty
            ? SizedBox(
                height: Get.height / 2,
                child: Center(
                  child: EmptyWidget(
                    message: 'noSummary'.tr,
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BalancesHistory'.tr,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: ColorManager.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: (controller.summery?.history ?? []).length,
                    itemBuilder: (context, index) =>
                        FinancialSummaryListItemWidget(
                      item: controller.summery!.history[index],
                    ),
                    separatorBuilder: (context, index) => 16.verticalSpace,
                  ),
                ],
              );
      },
    );
  }
}
