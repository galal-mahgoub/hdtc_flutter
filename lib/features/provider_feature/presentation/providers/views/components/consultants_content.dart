import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../../../../core/widgets/empty_widget.dart';
import '../../controllers/providers_controller.dart';
import 'provider_card.dart';
import 'provider_card_loading.dart';

class ConsultantsContent extends StatelessWidget {
  const ConsultantsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProvidersController>(
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: () => controller.getBusinessConsultations(),
          child: controller.isInstructorsLoading
              ? const ProviderCardLoading(
                  count: 10,
                )
              : controller.consultants.isEmpty
                  ? const EmptyWidget()
                  : AlignedGridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                     mainAxisSpacing: 16.r,
                      crossAxisSpacing: 16.r,
                      itemCount: controller.consultants.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ProviderCard(
                          provider: controller.consultants[index],
                        );
                      },
                    ),
        );
      },
    );
  }
}
