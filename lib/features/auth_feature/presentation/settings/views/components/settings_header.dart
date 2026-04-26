import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/consts/assets.dart';
import '../../../../../../core/theme/text_manager.dart';
import '../../../../../../core/widgets/custom_icon_button.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.mediaQueryPadding.top + 24.h,
        bottom: 16.h,
        left: 24.w,
        right: 24.w,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Profile',
              style: TextManager.font16Text300W600,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          8.horizontalSpace,
          CustomIconButton(
            icon: Assets.notificationIcon,
            size: 34.r,
            iconSize: 18.r,
          ),
        ],
      ),
    );
  }
}
