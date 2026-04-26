import 'package:carousel_slider/carousel_slider.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../domain/entities/course.dart';
import '../controllers/featured_courses_controller.dart';
import 'components/featured_card_loading.dart';
import 'components/featured_course_card.dart';

class FeaturedCoursesView extends StatelessWidget {
  const FeaturedCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeaturedCoursesController>(
      init: FeaturedCoursesController(
        featuredCoursesUseCase: Get.find(),
      ),
      builder: (controller) {
        if (!controller.isLoading && controller.featuredCourses.isEmpty) {
          return SizedBox(
            height: 16.h,
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FeaturedCourses'.tr,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.black,
                ),
              ),
              8.verticalSpace,
              ...controller.isLoading
                  ? [
                      const FeaturedCardLoading(),
                    ]
                  : [
                      CarouselSlider.builder(
                        itemCount: controller.featuredCourses.length,
                        itemBuilder:
                            (BuildContext context, index, int pageViewIndex) {
                          Course course = controller.featuredCourses[index];
                          return FeatureCourseCard(
                            course: course,
                          );
                        },
                        options: CarouselOptions(
                          initialPage: controller.currentSliderIndex,
                          height: 180.h,
                          autoPlayAnimationDuration: const Duration(
                            milliseconds: 800,
                          ),
                          scrollDirection: Axis.horizontal,
                          enlargeCenterPage: true,
                          autoPlay: false,
                          reverse: false,
                          enableInfiniteScroll: false,
                          viewportFraction: .9,
                          onPageChanged: (index, reason) =>
                              controller.changeSlider(index),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      if (controller.featuredCourses.length > 1)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            controller.featuredCourses.length,
                            (position) => Padding(
                              padding: EdgeInsets.only(right: 8.r),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: position == controller.currentSliderIndex
                                    ? 24.w
                                    : 8.w,
                                height: 8.h,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      controller.currentSliderIndex == position
                                          ? BorderRadius.circular(7.r)
                                          : BorderRadius.circular(7.r),
                                  color:
                                      controller.currentSliderIndex == position
                                          ? context.theme.primaryColor
                                          : ColorManager.grey1,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
            ],
          ),
        );
      },
    );
  }
}
