
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration customInputDecoration({
  String? hintText = '',
  Color? hintColor,
  int? hintFontSize,
  String? errorText,
  IconData? iconData,
  Color? iconColor,
  Widget? suffixIcon,
  Widget? suffix,
  bool border = false,
  Color? borderColor,
  int? borderRadius,
  Color? fillColor,
}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(fontSize: hintFontSize?.sp, color: hintColor),
    prefixIcon: iconData != null
        ? Icon(
            iconData,
            color: iconColor,
          )
        : const SizedBox(),
    prefixIconConstraints: iconData != null
        ? const BoxConstraints.expand(width: 38, height: 38)
        : const BoxConstraints.expand(width: 0, height: 0),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: const EdgeInsets.all(0),
    border: border
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!.r),
            borderSide: BorderSide(color: borderColor!),
          )
        : const OutlineInputBorder(borderSide: BorderSide.none),
    focusedBorder: border
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!.r),
            borderSide: BorderSide(color: borderColor!),
          )
        : const OutlineInputBorder(borderSide: BorderSide.none),
    enabledBorder: border
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!.r),
            borderSide: BorderSide(color: borderColor!),
          )
        : const OutlineInputBorder(borderSide: BorderSide.none),
    suffixIcon: suffixIcon,
    suffix: suffix,
    errorText: errorText,
    fillColor: fillColor,
    filled: true,
  );
}
