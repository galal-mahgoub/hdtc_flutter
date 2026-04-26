import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/features/others_feature/domain/entities/department.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../course_feature/domain/entities/course.dart';
import '../../controllers/support_controller.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget(
      {super.key, this.coursesObject, this.departmentObject, this.onChanged});

  final List<DropdownMenuItem<Course>>? coursesObject;
  final List<DropdownMenuItem<Department>>? departmentObject;
  final ValueChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SupportController>(
      builder: (controller) {
        return DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: ColorManager.grey6,
                  width: 1.w,
                ),
                color: ColorManager.white,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.grid_view_rounded,
                    color: ColorManager.grey5,
                    size: 25.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Expanded(
                    child: Text(
                        controller.currentIndex == 0
                            ? controller.selectedValueDepartments?.title ??
                                'SelectDepartment'.tr
                            : controller.selectedValueCourses?.title ??
                                'SelectCourse'.tr,
                        style: TextStyle(
                            color: ColorManager.grey5, fontSize: 15.sp)),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorManager.grey5,
                    size: 25.sp,
                  ),
                ],
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200.h,
              padding: null,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: ColorManager.white,
              ),
              elevation: 8,
              scrollbarTheme: ScrollbarThemeData(
                radius: Radius.circular(40.r),
                thickness: WidgetStateProperty.all<double>(6),
                thumbVisibility: WidgetStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 16.r),
            ),
            isExpanded: true,
            isDense: true,
            onChanged: onChanged!,
            items:
                controller.currentIndex == 0 ? departmentObject : coursesObject,
          ),
        );
      },
    );
  }
}
