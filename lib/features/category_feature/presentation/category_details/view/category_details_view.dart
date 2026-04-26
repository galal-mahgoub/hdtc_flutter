import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/widgets/custom_back_btn.dart';

import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/button_with_icon_widget.dart';
import '../../../../course_feature/presentation/featured_courses/views/featured_courses_view.dart';
import '../controllers/category_details_controller.dart';
import 'components/courses_list_categories_details_widget.dart';
import 'components/filter_categories_details_filter_bottom_sheet.dart';
import 'components/option_category_courses_bottomsheet.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryDetailsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              controller.title,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: ListView(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ButtonWithIconWidget(
                        width: 1.sw,
                        nameText: 'Option'.tr,
                        colorBorder: ColorManager.green4,
                        colorBackground: Colors.transparent,
                        colorText: ColorManager.green4,
                        icon: Icons.import_export,
                        radius: 10,
                        onPressed: () {
                          controller.typeFilter = 'option';

                          Get.bottomSheet(
                            const OptionCategoryCoursesBottomsheet(),
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                          );
                        },
                        paddingHorizontal: 5,
                        paddingVertical: 5,
                        // marginHorizontal: 10,
                      ),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: controller.categoryCourse != null &&
                              controller.categoryCourse!.filters.isNotEmpty
                          ? ButtonWithIconWidget(
                              width: 1.sw,
                              nameText: 'Filter'.tr,
                              colorBorder: ColorManager.green4,
                              colorBackground: Colors.transparent,
                              colorText: ColorManager.green4,
                              icon: Icons.tune,
                              radius: 10,
                              onPressed: () {
                                controller.typeFilter = 'filter';

                                Get.bottomSheet(
                                  const FilterCategoryCoursesBottomsheet(),
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                );
                              },
                              paddingHorizontal: 5,
                              paddingVertical: 5,
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                const FeaturedCoursesView(),
                const CoursesListCategoriesDetailsWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
