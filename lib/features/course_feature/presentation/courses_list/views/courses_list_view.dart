import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_loading.dart';
import 'package:hdtc_on/core/widgets/no_more_items.dart';
import 'package:hdtc_on/core/widgets/page_list_course_card.dart';
import 'package:hdtc_on/features/course_feature/domain/entities/course.dart';
import 'package:hdtc_on/features/course_feature/presentation/courses_list/controllers/courses_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../../../../../core/widgets/empty_widget.dart';
import '../../../../../core/widgets/error_page_indicator.dart';
import '../../../../../core/widgets/page_list_course_loading.dart';

class CoursesListView extends StatelessWidget {
  const CoursesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesListController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.white13,
          appBar: AppBar(
            backgroundColor: ColorManager.white13,
            centerTitle: true,
            title: Text(
              Get.arguments?['title'] ?? '',
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: CustomLoading(
            widget: PagedListView<int, Course>.separated(
              padding: const EdgeInsets.all(16).r,
              scrollDirection: Axis.vertical,
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<Course>(
                itemBuilder: (context1, course, index) {
                  return PageListCourseCard(course: course);
                },
                firstPageProgressIndicatorBuilder: (_) =>
                    const PageListCourseLoading(
                  count: 10,
                ),
                newPageProgressIndicatorBuilder: (_) =>  Center(
                  child: CircularProgressIndicator(
                    color: context.theme.primaryColor,
                  ),
                ),
                noItemsFoundIndicatorBuilder: (_) => EmptyWidget(
                  message: 'NoCourses'.tr,
                ),
                newPageErrorIndicatorBuilder: (_) => ErrorPageIndicator(
                  message: controller.pagingController.error,
                  press: () => controller.pagingController.refresh(),
                ),
                firstPageErrorIndicatorBuilder: (_) => ErrorPageIndicator(
                  message: controller.pagingController.error,
                  press: () => controller.pagingController.refresh(),
                ),
                noMoreItemsIndicatorBuilder: (_) => const NoMoreItems(),
              ),
              separatorBuilder: (context, index) => 16.verticalSpace,
            ),
            isLoading: controller.isLoading,
          ),
        );
      },
    );
  }
}
