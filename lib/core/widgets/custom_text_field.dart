import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/color_manager.dart';
import '../theme/text_manager.dart';
import 'custom_image.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.validator,
    this.controller,
    this.hintText,
    this.isNumberOnly = false,
    this.keyboardType,
    this.enabled,
    this.fillColor = ColorManager.textfieldBgColor,
    this.maxLines,
    this.onChanged,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.disabledBorder,
    this.contentPadding,
    this.textAlignVertical,
    this.prefixIcon,
    this.prefixWidget,
    this.suffixIconClr,
    this.suffixIcon,
    this.suffixWidget,
    this.onTap,
    this.isObSecure,
    this.borderRadius,
    this.prefixIconSize,
    this.prefixIconColor,
    this.onEditingComplete,
    this.readOnly = false,
    this.expands = false,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? hintText;

  final bool isNumberOnly;
  final TextInputType? keyboardType;
  final bool? enabled;
  final Color? fillColor;
  final int? maxLines;
  final void Function(String)? onChanged;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlignVertical? textAlignVertical;
  final String? prefixIcon;
  final Widget? prefixWidget;
  final String? suffixIcon;
  final Color? suffixIconClr;
  final Color? prefixIconColor;
  final Widget? suffixWidget;
  final void Function()? onTap;
  final bool? isObSecure;
  final bool readOnly;
  final BorderRadius? borderRadius;
  final bool expands;
  final double? prefixIconSize;
  final void Function()? onEditingComplete;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObSecure = false;
  @override
  void initState() {
    isObSecure = widget.isObSecure ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: widget.onEditingComplete,
      expands: widget.expands,
      readOnly: widget.readOnly,
      style: TextManager.font16Text300W400,
      obscureText: isObSecure,
      maxLines: widget.maxLines,
      enabled: widget.enabled,
      keyboardType: widget.isNumberOnly
          ? const TextInputType.numberWithOptions(decimal: true)
          : widget.keyboardType,
      inputFormatters: [
        if (widget.isNumberOnly)
          FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))
      ],
      controller: widget.controller,
      validator: widget.validator,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      textAlignVertical: widget.textAlignVertical,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding ?? const EdgeInsets.all(16).r,
        disabledBorder: widget.disabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorManager.textfieldBorderColor,
              ),
              borderRadius: widget.borderRadius ??
                  BorderRadius.all(
                    Radius.circular(8.r),
                  ),
            ),
        enabledBorder: widget.enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorManager.textfieldBorderColor,
              ),
              borderRadius: widget.borderRadius ??
                  BorderRadius.all(
                    Radius.circular(8.r),
                  ),
            ),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorManager.textfieldBorderColor,
              ),
              borderRadius: widget.borderRadius ??
                  BorderRadius.all(
                    Radius.circular(8.r),
                  ),
            ),
        border: widget.border ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorManager.textfieldBorderColor,
              ),
              borderRadius: widget.borderRadius ??
                  BorderRadius.all(
                    Radius.circular(8.r),
                  ),
            ),
        hintStyle: TextManager.font14HintTxtW400,
        errorStyle: TextManager.font14RedW400,
        fillColor: widget.fillColor,
        filled: widget.fillColor != null,
        hintText: widget.hintText,
        suffixIcon: widget.isObSecure != null
            ? InkWell(
                onTap: () {
                  setState(() {
                    isObSecure = !isObSecure;
                  });
                },
                child: SizedBox(
                  height: 24.r,
                  width: 24.r,
                  child: Center(
                    child: Icon(
                      isObSecure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: ColorManager.text75Color,
                      size: 24.r,
                    ),
                  ),
                ),
              )
            : widget.suffixIcon == null
                ? widget.suffixWidget
                : SizedBox(
                    height: 24.r,
                    width: 24.r,
                    child: Center(
                      child: CustomImage(
                        path: widget.suffixIcon,
                        color: widget.suffixIconClr,
                      ),
                    ),
                  ),
        prefixIcon: widget.prefixIcon == null
            ? widget.prefixWidget
            : SizedBox(
                height: widget.prefixIconSize ?? 24.r,
                width: widget.prefixIconSize ?? 24.r,
                child: Center(
                  child: CustomImage(
                    path: widget.prefixIcon,
                    color: widget.prefixIconColor,
                    height: widget.prefixIconSize ?? 24.r,
                    width: widget.prefixIconSize ?? 24.r,
                  ),
                ),
              ),
      ),
    );
  }
}
