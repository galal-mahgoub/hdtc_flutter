import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';

import '../../../../../others_feature/domain/entities/country.dart';
import '../../controllers/update_profile_controller.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
    this.data,
    this.dataObject,
    this.type,
    this.onChanged,
    required this.value,
  });

  final List<DropdownMenuItem<String>>? data;
  final List<DropdownMenuItem<Country>>? dataObject;
  final String? type;
  final ValueChanged? onChanged;
  final String value;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateProfileController>(
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
                  Expanded(
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
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
            buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
            )),
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
            items: data ?? dataObject,
          ),
        );
      },
    );
  }
}
