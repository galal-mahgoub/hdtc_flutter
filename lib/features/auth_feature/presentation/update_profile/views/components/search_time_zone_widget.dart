import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/consts/assets.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:hdtc_on/core/widgets/custom_text_field.dart';

import '../../controllers/update_profile_controller.dart';

class SearchTimeZoneWidget extends StatelessWidget {
  const SearchTimeZoneWidget({super.key, this.data, this.onChanged});

  final List<DropdownMenuItem<String>>? data;
  final ValueChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateProfileController>(
      builder: (controller) {
        return DropdownButtonHideUnderline(
          child: DropdownButton2(
            dropdownSearchData: DropdownSearchData(
              searchController: controller.srchTimeZoneCtrl,
              searchInnerWidgetHeight: 50.h,
              searchInnerWidget: Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 4,
                  right: 8,
                  left: 8,
                ),
                child: CustomTextField(
                  controller: controller.srchTimeZoneCtrl,
                  hintText: "Search a country".tr,
                  prefixIcon: Assets.searchIcon,
                ),
              ),
              searchMatchFn: (item, searchValue) {
                return item.value
                    .toString()
                    .toLowerCase()
                    .contains(searchValue.toLowerCase());
              },
            ),
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                controller.srchTimeZoneCtrl.clear();
                controller.update();
              }
            },
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
                      controller.selectedValueTimeZone,
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
                thickness: WidgetStateProperty .all<double>(6),
                thumbVisibility: WidgetStateProperty .all<bool>(true),
              ),
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
