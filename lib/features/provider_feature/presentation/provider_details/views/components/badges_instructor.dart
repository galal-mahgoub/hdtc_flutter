import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../controllers/instructor_details_controller.dart';
import 'package:hdtc_on/features/auth_feature/domain/entities/badge.dart' as provide_badge;

class BadgesListWidget extends StatelessWidget {
  const BadgesListWidget({Key? key}) : super(key: key);

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
          itemCount: controller.provider!.badges.length,
          itemBuilder: (context, index) {
            return BadgeCard(
              badge: controller.provider!.badges[index],
            );
          },
        );
      },
    );
  }
}

class BadgeCard extends StatelessWidget {
  const BadgeCard({
    super.key,
    required this.badge,
  });

  final provide_badge.Badge badge;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 160.h,
      decoration: BoxDecoration(
        color: ColorManager.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60.r,
            width: 60.r,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(55.r),
              child: CustomImage(
                path: badge.image.isNotEmpty ? badge.image : null,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            badge.title,
            maxLines: 2,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 12.sp,
              color: ColorManager.black,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            badge.description,
            maxLines: 2,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 10.sp,
              color: ColorManager.grey4,
            ),
          ),
        ],
      ),
    );
  }
}
