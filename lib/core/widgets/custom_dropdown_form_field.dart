
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/color_manager.dart';
import '../theme/text_manager.dart';

class CustomDropDownFormField extends StatelessWidget {
  const CustomDropDownFormField({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    this.icon,
    this.hintText,
    this.validator,
  });

  final List<DropdownMenuItem>? items;
  final void Function(dynamic)? onChanged;
  final dynamic value;
  final Widget? icon;
  final String? hintText;
  final String? Function(dynamic)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: items,
      style: TextManager.font16Text300W400,
      onChanged: onChanged,
      value: value,
      icon: icon,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16).r,
        hintText: hintText,
        filled: true,
        fillColor: ColorManager.textfieldBgColor,
        hintStyle: TextManager.font14HintTxtW400,
        errorStyle: TextManager.font14RedW400,
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.textfieldBorderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.textfieldBorderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.textfieldBorderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorManager.textfieldBorderColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
      ),
      validator: validator,
    );
  }
}
