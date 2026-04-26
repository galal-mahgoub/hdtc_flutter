import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_input_decoration.dart';
import 'package:hdtc_on/core/widgets/page_list_course_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/languages/app_translations.dart';
import '../../../../../core/theme/text_manager.dart';
import '../../../../../core/widgets/custom_back_btn.dart';
import '../controllers/search_courses_controller.dart';
import '../../../../../core/widgets/page_list_course_card.dart';

class SearchCoursesView extends StatelessWidget {
  const SearchCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchCoursesController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.white13,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'SearchResult'.tr,
              style: TextManager.font16Text300W600,
            ),
            leadingWidth: 80,
            leading: const CustomBackBtn(),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16).r,
            children: [
              Center(
                child: Form(
                  key: controller.formSearch,
                  child: TextField(
                    onChanged: (value) => controller.debouncer.call(
                      () async => await controller.searchCourses(),
                    ),
                    controller: controller.searchCtrl,
                    style: Get.textTheme.bodyMedium,
                    autofocus: false,
                    cursorColor: Get.theme.focusColor,
                    decoration: customInputDecoration(
                      hintText: "WhatAreGoingFind".tr,
                      iconData: Icons.search,
                      border: true,
                      borderRadius: 15,
                      borderColor: Colors.transparent,
                      iconColor: Colors.black87,
                      hintColor: ColorManager.grey1,
                      hintFontSize: 13,
                      fillColor: ColorManager.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              controller.isLoading
                  ? const PageListCourseLoading(
                      count: 10,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (controller.searchCtrl.text.isEmpty &&
                            controller.suggestedCourses.isNotEmpty) ...[
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.r,
                            ),
                            child: Text(
                              'Suggested'.tr,
                              style: TextStyle(
                                fontSize: 17.sp,
                                color: ColorManager.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                        (controller.searchCtrl.text.isNotEmpty &&
                                    controller.searchedCourses.isEmpty) ||
                                controller.suggestedCourses.isEmpty
                            ? SizedBox(
                                height: Get.height / 2,
                                child: Center(
                                  child: Text(
                                    LocaleKeys.noCoursesAvailable.tr,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.searchCtrl.text.isNotEmpty
                                    ? controller.searchedCourses.length
                                    : controller.suggestedCourses.length,
                                itemBuilder: (context, index) {
                                  return PageListCourseCard(
                                    course: controller
                                            .searchCtrl.text.isNotEmpty
                                        ? controller.searchedCourses[index]
                                        : controller.suggestedCourses[index],
                                  );
                                },
                              ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}
