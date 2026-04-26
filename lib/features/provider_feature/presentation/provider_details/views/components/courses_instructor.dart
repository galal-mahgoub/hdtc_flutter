import 'package:hdtc_on/core/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../controllers/instructor_details_controller.dart';

class CoursesInstructor extends StatelessWidget {
  const CoursesInstructor({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InstructorDetailsController>(
      builder: (controller) {
        return AlignedGridView.count(
          crossAxisSpacing: 16.r,
          mainAxisSpacing: 16.r,
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.provider!.courses.length,
          itemBuilder: (context, index) {
            return CourseCard(
              course: controller.provider!.courses[index],
            );
          },
        );
      },
    );
  }
}
