import 'package:hdtc_on/core/theme/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/consts/assets.dart';
import '../../../../../../core/theme/color_manager.dart';
import '../../../../../../core/widgets/custom_image.dart';

class LangaugeCard extends StatelessWidget {
  const LangaugeCard({
    super.key,
    required this.isSelected,
    required this.onSelectLangTap,
    required this.text,
    required this.icon,
  });
  final bool isSelected;
  final void Function()? onSelectLangTap;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelectLangTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ).r,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? ColorManager.secondary300Color
                : ColorManager.primary75Color,
            width: (isSelected ? 1.5 : .5).w,
          ),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  /// Flag Img
                  Container(
                    width: 40.r,
                    height: 40.r,
                    decoration: const BoxDecoration(
                      color: ColorManager.primary50Color,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: CustomImage(
                        path: icon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  12.horizontalSpace,

                  /// Text
                  Text(
                    text,
                    textAlign: TextAlign.end,
                    style: TextManager.font16Text200W400,
                  )
                ],
              ),
            ),

            /// Check Icon
            CustomImage(
              path: Assets.checkCircleIcon,
              height: 24.r,
              width: 24.r,
              color: isSelected
                  ? ColorManager.secondary300Color
                  : ColorManager.primary75Color,
            ),
          ],
        ),
      ),
    );
  }
}
