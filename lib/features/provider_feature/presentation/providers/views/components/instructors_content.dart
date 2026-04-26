import 'package:hdtc_on/core/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../controllers/providers_controller.dart';
import 'provider_card.dart';
import 'provider_card_loading.dart';

class InstructorsContent extends StatelessWidget {
  const InstructorsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProvidersController>(
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: () => controller.getInstructors(),
          child: controller.isInstructorsLoading
              ? const ProviderCardLoading(
                  count: 10,
                )
              : controller.instructors.isEmpty
                  ? const EmptyWidget()
                  : AlignedGridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.r,
                      crossAxisSpacing: 16.r,
                      itemCount: controller.instructors.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ProviderCard(
                          provider: controller.instructors[index],
                        );
                      },
                    ),
        );
      },
    );
  }
}
