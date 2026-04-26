import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/text_manager.dart';

class CustomTabItem extends StatelessWidget {
  const CustomTabItem({
    super.key,
    this.onTap,
    this.isSelected = false,
    this.showLabel = false,
    this.label = '',
    this.icon,
  });

  final VoidCallback? onTap;
  final bool isSelected;
  final bool showLabel;
  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // AnimatedContainer(
            //   curve: Curves.linear,
            //   duration: const Duration(milliseconds: 200),
            //   height: isSelected ? 2.h : 0,
            //   decoration: BoxDecoration(
            //     color: ColorManager.green,
            //     borderRadius: BorderRadius.circular(8.r),
            //   ),
            // ),
            const Spacer(),
            if (icon != null)
              Icon(
                icon,
                size: 24.h,
              ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: showLabel
                  ? null
                  : isSelected
                      ? null
                      : 0,
              child: Text(
                label,
                style: TextManager.font12Text300W600,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
