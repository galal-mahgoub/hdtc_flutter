import 'package:hdtc_on/features/course_feature/presentation/best_rated_courses/controllers/best_rated_courses_controller.dart';
import 'package:hdtc_on/features/course_feature/presentation/featured_courses/controllers/featured_courses_controller.dart';
import 'package:hdtc_on/features/course_feature/presentation/free_courses/controllers/free_courses_controller.dart';
import 'package:hdtc_on/features/course_feature/presentation/newest_courses/controllers/newest_courses_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../../course_feature/presentation/best_rated_courses/views/best_rated_courses_view.dart';
import '../../../../course_feature/presentation/featured_courses/views/featured_courses_view.dart';
import '../../../../course_feature/presentation/free_courses/views/free_courses_view.dart';
import '../../../../course_feature/presentation/newest_courses/views/newest_course_view.dart';
import 'components/home_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              Future.wait([
                FeaturedCoursesController.to.getFeaturedCourses(),
                NewestCoursesController.to.getNewestCourses(),
                BestRatedCoursesController.to.getBestRatedCourses(),
                FreeCoursesController.to.getFreeCourses(),
              ]);
            },
            child: CustomScrollView(
              slivers: [
                const HomeAppbar(),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: const Column(
                          children: [
                            FeaturedCoursesView(),
                            NewestCoursesView(),
                            BestRatedCoursesView(),
                            FreeCoursesView(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
