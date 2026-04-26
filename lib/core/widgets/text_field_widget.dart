import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';

Widget textFormField(
        {TextEditingController? controller,
        TextInputType? type,
        bool lengthStringValidation = false,
        String? label,
        Color? labelColor,
        Color? prefixIconColor,
        String? hint,
        String? prefixIconString,
        Widget? prefixIcon,
        bool isPassword = false,
        String? validatorMessage,
        TextEditingController? controllerValidatorType,
        bool suffix = false,
        Widget? iconSuffix,
        VoidCallback? onEditingComplete,
        bool enabled = true,
        bool readOnly = false,
        double textSize = 16,
        double labelSize = 16,
        int? maxLine,
        Color? borderColor,
        InputBorder? enabledBorder,
        FormFieldSetter<String>? onSaved,
        ValueChanged<String>? changed,
        Function? submit,
        Function? onTap,
        Function? suffixPressed}) =>
    TextFormField(
      enabled: enabled,
      enableInteractiveSelection: true,
      controller: controller,
      keyboardType: type,
      inputFormatters: type == TextInputType.number
          ? [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly,
            ]
          : null,
      obscureText: isPassword,
      readOnly: readOnly,
      maxLines: isPassword ? 1 : maxLine,
      style: TextStyle(
        fontSize: textSize.sp,
        color: ColorManager.black2,
      ),
      // to move next editText
      onEditingComplete: onEditingComplete,
      cursorColor: ColorManager.black,
      decoration: InputDecoration(
        isDense: true,
        labelText: label,
        labelStyle: TextStyle(
          fontSize: labelSize.sp,
          color: labelColor,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: textSize.sp,
          color: ColorManager.black3.withOpacity(0.3),
        ),
        prefixIcon: prefixIconString != null || prefixIcon != null
            ? Container(
                padding: EdgeInsets.only(
                    top: 10.r, right: 18.r, bottom: 10.r, left: 10.r),
                child: prefixIconString != null
                    ? SvgPicture.asset(prefixIconString)
                    : prefixIcon,
              )
            : null,
        suffixIcon: suffix
            ? IconButton(
                onPressed: () {
                  suffixPressed != null ? suffixPressed() : null;
                },
                icon: iconSuffix ??
                    Icon(
                      isPassword ? Icons.visibility_off : Icons.visibility,
                      color: ColorManager.black,
                      size: 25.sp,
                    ),
              )
            : null,
        filled: true,
        //to make background
        fillColor: borderColor,
        //for background color
        enabledBorder: enabledBorder,
        // OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10.r),
        //   borderSide: BorderSide(color: borderColor!),
        // ),
        focusedBorder: enabledBorder,
        border: enabledBorder,
        errorBorder: enabledBorder,
        errorMaxLines: 3,
        errorStyle:
            TextStyle(color: ColorManager.red, fontSize: (textSize - 2).sp),
      ),
      onSaved: onSaved,
      onChanged: changed,
      validator: (validatorText) {
        // if (type == TextInputType.number && validatorText!.length > 6) {
        //   return validatorMessage;
        // } else if (validatorText!.isEmpty || validatorText.trim().isEmpty) {
        //   return validatorMessage;
        // }
        if (type == TextInputType.number &&
            validatorText.toString().length < 9) {
          return validatorMessage;
        } else if ((validatorText!.isNotEmpty ||
                validatorText.trim().isNotEmpty) &&
            lengthStringValidation &&
            validatorText.trim().length < 6) {
          return 'PasswordGreaterThan6'.tr;
        } else if (validatorText.isEmpty || validatorText.trim().isEmpty) {
          return validatorMessage;
        }
        return null;
      },
      onFieldSubmitted: (s) {
        submit != null ? submit(s) : null;
      },
      onTap: () {
        onTap != null ? onTap() : null;
      },
    );
