import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/courses_details_controller.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    this.data,
    this.onChanged,
    this.isError = false,
  });

  final List<DropdownMenuItem<String>>? data;
  final ValueChanged? onChanged;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoursesDetailsController>(
      builder: (controller) {
        return DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: Container(
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 12.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isError ? ColorManager.red : ColorManager.grey6,
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
                      controller.selectedValueReport,
                      style: TextStyle(
                        color: ColorManager.grey5,
                        fontSize: 15.sp,
                      ),
                    ),
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
            items: data,
          ),
        );
      },
    );
  }
}
