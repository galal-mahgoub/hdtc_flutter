import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/theme/color_manager.dart';
import '../../../../../../core/theme/text_manager.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.icon,
    required this.title,
    this.titleColor,
    this.iconColor,
    this.onTap,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final Color? titleColor;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6.r),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.text50Color,
          ),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: ListTile(
          leading: Container(
            height: 32.r,
            width: 32.r,
            decoration: BoxDecoration(
              color: iconColor?.withOpacity(.1) ??
                  (context.theme.primaryColor).withOpacity(.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icon,
                color: iconColor ?? context.theme.primaryColor,
              ),
            ),
          ),
          title: Text(
            title,
            style: TextManager.font14Text300W500.copyWith(color: titleColor),
          ),
          trailing: trailing ??
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorManager.text300Color,
                size: 16.r,
              ),
        ),
      ),
    );
  }
}
