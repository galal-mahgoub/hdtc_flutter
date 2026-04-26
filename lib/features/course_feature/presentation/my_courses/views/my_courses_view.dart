import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/course_card.dart';
import 'package:hdtc_on/features/auth_feature/presentation/mainlayout/controllers/mainlayout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../../../../../core/widgets/empty_widget.dart';
import '../../../domain/entities/course.dart';
import '../controllers/my_courses_controller.dart';
import 'components/my_courses_loading_grid.dart';

class MyCoursesView extends StatelessWidget {
  const MyCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCoursesController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.white13,
          appBar: AppBar(
            backgroundColor: ColorManager.white13,
            centerTitle: true,
            title: Text(
              'MyCourses'.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: RefreshIndicator(
            onRefresh: () => Future.wait([
              controller.getMyCourses(),
            ]),
            child: controller.isLoading
                ? const MyCoursesLoadingGrid()
                : controller.courses.isEmpty
                    ? ListView(
                        children: [
                          SizedBox(
                            height: Get.height / 2,
                            child: EmptyWidget(
                              message: 'NoCourses'.tr,
                              nameBtn: Text(
                                'Courses'.tr,
                                style: TextStyle(
                                    fontSize: 15.sp, color: ColorManager.white),
                              ),
                              onPressed: () {
                                MainLayoutController.to.changeIndex(2);
                              },
                            ),
                          ),
                        ],
                      )
                    : AlignedGridView.count(
                        crossAxisSpacing: 16.r,
                        mainAxisSpacing: 16.r,
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(16).r,
                        itemCount: controller.courses.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          Course course = controller.courses[index];
                          return CourseCard(
                            course: course,
                          );
                        },
                      ),
          ),
        );
      },
    );
  }
}
