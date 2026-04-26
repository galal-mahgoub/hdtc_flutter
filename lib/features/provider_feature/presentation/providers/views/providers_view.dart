import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/services/user_service.dart';
import '../../../../../core/theme/text_manager.dart';
import '../controllers/providers_controller.dart';
import 'components/consultants_content.dart';
import 'components/filter_instructors_bottom_sheet.dart';
import 'components/filter_business_consultants_bottom_sheet.dart';
import 'components/instructors_content.dart';

class ProvidersView extends StatelessWidget {
  const ProvidersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProvidersController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Instructors'.tr,
              style: TextManager.font16Text300W600,
            ),
            actions: [
              InkWell(
                onTap: () => Get.bottomSheet(
                  controller.currentIndex == 0
                      ? const FilterInstructorsBottomSheet()
                      : const FilterBusinessConsultantsBottomSheet(),
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(13.r),
                ),
                child: Container(
                  height: 40.r,
                  width: 40.r,
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.all(Radius.circular(13.r)),
                  ),
                  child: Icon(
                    Icons.tune,
                    size: 20.sp,
                    color: ColorManager.black,
                  ),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16).r,
            children: <Widget>[
              CustomSlidingSegmentedControl<int>(
                customSegmentSettings: CustomSegmentSettings(
                  borderRadius: BorderRadius.circular(36.r),
                ),
                isStretch: true,
                innerPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ).r,
                initialValue: controller.currentIndex,
                children: {
                  0: Text(
                    "Instructors".tr,
                    style: controller.currentIndex == 0
                        ? TextManager.font14WhiteW500
                        : TextManager.font14Text75W400.copyWith(
                            color: UserService.to.isKsa.value
                                ? Colors.green[400]
                                : ColorManager.green,
                          ),
                  ),
                  1: Text(
                    "BusinessConsultants".tr,
                    style: controller.currentIndex == 1
                        ? TextManager.font14WhiteW500
                        : TextManager.font14Text75W400.copyWith(
                            color: UserService.to.isKsa.value
                                ? Colors.green[400]
                                : ColorManager.green,
                          ),
                  ),
                },
                padding: 0,
                decoration: BoxDecoration(
                  color: (UserService.to.isKsa.value
                          ? Colors.green[400]
                          : ColorManager.green)!
                      .withOpacity(.1),
                  borderRadius: BorderRadius.circular(36.r),
                ),
                thumbDecoration: BoxDecoration(
                  color: UserService.to.isKsa.value
                      ? Colors.green[400]
                      : ColorManager.green,
                  borderRadius: BorderRadius.circular(28.r),
                ),
                curve: Curves.linear,
                onValueChanged: (value) => controller.changeViewIndex(value),
              ),
              16.verticalSpace,
              ExpandablePageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  InstructorsContent(),
                  ConsultantsContent(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
