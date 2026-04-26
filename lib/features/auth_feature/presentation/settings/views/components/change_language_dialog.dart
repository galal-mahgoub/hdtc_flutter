import 'package:hdtc_on/core/consts/enums.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangeLanguageDialog extends StatelessWidget {
  const ChangeLanguageDialog({
    super.key,
    this.onTapClose,
    this.onTapAr,
    this.onTapEn,
  });

  final VoidCallback? onTapClose;
  final VoidCallback? onTapAr;
  final VoidCallback? onTapEn;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 15.r),
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 1.w,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SelectLanguage'.tr,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: ColorManager.black,
                  ),
                ),
                InkWell(
                  onTap: onTapClose,
                  child: Icon(
                    Icons.close,
                    size: 25.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Column(
              children: [
                InkWell(
                  onTap: onTapAr,
                  child: Row(
                    children: [
                      // CustomImage(
                      //   path: Assets.arIcon,
                      //   height: 30.r,
                      //   width: 30.r,
                      //   fit: BoxFit.contain,
                      // ),
                      // SizedBox(
                      //   width: 15.w,
                      // ),
                      Text(
                        'Arabic',
                        style: TextStyle(
                          fontWeight: (Get.locale?.languageCode ?? 'en') ==
                                  Language.ar.name
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 15.sp,
                          color: ColorManager.black,
                        ),
                      ),
                      const Spacer(),
                      if ((Get.locale?.languageCode ?? 'en') ==
                          Language.ar.name)
                        Container(
                          height: 16.r,
                          width: 16.r,
                          decoration: const BoxDecoration(
                            color: ColorManager.yellow,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              height: 14.r,
                              width: 14.r,
                              decoration: BoxDecoration(
                                color: ColorManager.yellow,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: ColorManager.white,
                                  width: 2.r,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                InkWell(
                  onTap: onTapEn,
                  child: Row(
                    children: [
                      // CustomImage(
                      //   path: Assets.enIcon,
                      //   height: 30.r,
                      //   width: 30.r,
                      //   fit: BoxFit.contain,
                      // ),
                      // SizedBox(
                      //   width: 15.w,
                      // ),
                      Text(
                        'English'.tr,
                        style: TextStyle(
                          fontWeight: (Get.locale?.languageCode ?? 'en') ==
                                  Language.en.name
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontSize: 15.sp,
                          color: ColorManager.black,
                        ),
                      ),
                      const Spacer(),
                      if ((Get.locale?.languageCode ?? 'en') ==
                          Language.en.name)
                        Container(
                          height: 16.r,
                          width: 16.r,
                          decoration: const BoxDecoration(
                            color: ColorManager.yellow,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              height: 14.r,
                              width: 14.r,
                              decoration: BoxDecoration(
                                color: ColorManager.yellow,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: ColorManager.white,
                                  width: 2.r,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
          ]),
        ),
      ),
    );
  }
}
