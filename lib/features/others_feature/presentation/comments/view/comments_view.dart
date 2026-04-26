import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:hdtc_on/core/services/user_service.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/widgets/empty_widget.dart';

import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../controllers/comments_controller.dart';
import 'components/comments_list_widget.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Comments'.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: CustomLoading(
            widget: controller.isLoading
                ? const SizedBox()
                : controller.comment == null
                    ? Center(
                        child: EmptyWidget(
                       
                          message: 'NoComments'.tr,
                        ),
                      )
                    : ListView(
                        padding: EdgeInsets.all(16.r),
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
                                "MyComments".tr,
                                style: controller.currentIndex == 0
                                    ? TextManager.font14WhiteW500
                                    : TextManager.font14Text75W400.copyWith(
                                        color:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                                      ),
                              ),
                              if (UserService.to.currentUser.value!.roleName !=
                                  'user')
                                1: Text(
                                  "MyClassComments".tr,
                                  style: controller.currentIndex == 1
                                      ? TextManager.font14WhiteW500
                                      : TextManager.font14Text75W400.copyWith(
                                          color:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                                        ),
                                ),
                            },
                            padding: 0,
                            decoration: BoxDecoration(
                              color:(UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green)!.withOpacity(.1),
                              borderRadius: BorderRadius.circular(36.r),
                            ),
                            thumbDecoration: BoxDecoration(
                              color:UserService.to.isKsa.value
                          ? Colors.green[400]
                          :  ColorManager.green,
                              borderRadius: BorderRadius.circular(28.r),
                            ),
                            curve: Curves.linear,
                            onValueChanged: (value) =>
                                controller.changeViewIndex(value),
                          ),
                          16.verticalSpace,
                          ExpandablePageView(
                            controller: controller.pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              CommentsListWidget(
                                data: [
                                  ...controller.comment!.myComment.blogs,
                                  ...controller.comment!.myComment.webinars,
                                ],
                                type: 'comment',
                              ),
                              if (UserService.to.currentUser.value!.roleName !=
                                  'user')
                                CommentsListWidget(
                                  data: controller.comment!.classComment,
                                  type: 'classComment',
                                ),
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
