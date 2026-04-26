import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/languages/app_translations.dart';
import '../../../../../../core/widgets/empty_widget.dart';
import '../../../../domain/entities/content.dart';
import '../../controllers/new_learning_page_controller.dart';
import 'content_list_subtitle_new_learning_page_widget.dart';
import 'content_list_title_new_learning_page_widget.dart';

class ContentListNewLearningPageWidget extends StatelessWidget {
  const ContentListNewLearningPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewLearningPageController>(
      builder: (controller) {
        return controller.contents.isNotEmpty
            ? ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.contents.length,
                itemBuilder: (context, index) {
                  Content content = controller.contents[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      color: ColorManager.white,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.r),
                    child: Column(
                      children: [
                        ExpansionTile(
                          backgroundColor: ColorManager.white,
                          collapsedBackgroundColor: ColorManager.white,
                          collapsedIconColor: content.items.isNotEmpty
                              ? ColorManager.grey4
                              : ColorManager.white,
                          iconColor: content.items.isNotEmpty
                              ? ColorManager.grey4
                              : ColorManager.white,
                          tilePadding: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide.none // Adjust the border radius
                              ),
                          collapsedShape: const RoundedRectangleBorder(
                              side: BorderSide.none // Adjust the border radius
                              ),
                          title: ContentListTitleNewLearningPageWidget(
                              title: content.title,
                              numLessons: content.items.length),
                          children:
                              List.generate(content.items.length, (index) {
                            bool isLastItem = index == content.items.length - 1;
                            return ContentListSubTitleNewLearningPageWidget(
                              item: content.items[index],
                              title: content.title,
                              isLast: isLastItem,
                              authStatus: controller.course.quizzes!
                                      .where((element) =>
                                          element.id == content.items[index].id)
                                      .isNotEmpty
                                  ? controller.course.quizzes!
                                          .where((element) =>
                                              element.id ==
                                              content.items[index].id)
                                          .first
                                          .authStatus ??
                                      ''
                                  : '',
                            );
                          }),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => 16.verticalSpace,
              )
            : SizedBox(
                height: Get.height / 2,
                child: Center(
                  child: EmptyWidget(
                    message: LocaleKeys.noContentAvailable.tr,
                  ),
                ),
              );
      },
    );
  }
}
