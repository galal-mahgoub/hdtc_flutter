import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/widgets/custom_back_btn.dart';
import 'package:hdtc_on/core/widgets/custom_loading.dart';

import '../../../../../core/services/user_service.dart';
import '../../../../../core/theme/text_manager.dart';
import '../controllers/new_learning_page_controller.dart';
import 'components/content_list_new_learning_page_widget.dart';
import 'components/notices_list_new_learning_page_widget.dart';
import 'components/quiz_list_new_learning_page_widget.dart';

class NewLearningPageView extends StatelessWidget {
  const NewLearningPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewLearningPageController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.white13,
          appBar: AppBar(
            backgroundColor: ColorManager.white13,
            centerTitle: true,
            title: Text(
              'LearningPage'.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: CustomLoading(
            widget: ListView(
              padding: const EdgeInsets.all(16).r,
              children: [
                CustomSlidingSegmentedControl<int>(
                  customSegmentSettings: CustomSegmentSettings(
                    borderRadius: BorderRadius.circular(36.r),
                  ),
                  isStretch: true,
                  innerPadding: const EdgeInsets.all(8).r,
                  initialValue: controller.currentIndex,
                  children: {
                    0: Text(
                      "Content".tr,
                      style: controller.currentIndex == 0
                          ? TextManager.font14WhiteW500
                          : TextManager.font14Text75W400.copyWith(
                              color: UserService.to.isKsa.value
                                  ? Colors.green[400]
                                  : ColorManager.green,
                            ),
                    ),
                    1: Text(
                      "Quizzes".tr,
                      style: controller.currentIndex == 1
                          ? TextManager.font14WhiteW500
                          : TextManager.font14Text75W400.copyWith(
                              color: UserService.to.isKsa.value
                                  ? Colors.green[400]
                                  : ColorManager.green,
                            ),
                    ),
                    2: Text(
                      "Notices".tr,
                      style: controller.currentIndex == 2
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
                    ContentListNewLearningPageWidget(),
                    QuizListNewLearningPageWidget(),
                    NoticesListNewLearningPageWidget(),
                  ],
                ),
              ],
            ),
            isLoading: controller.isLoading,
          ),
        );
      },
    );
  }
}
