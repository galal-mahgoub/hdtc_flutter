import 'package:flutter_html/flutter_html.dart';
import 'package:hdtc_on/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TextWrapper extends StatefulWidget {
  const TextWrapper({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<TextWrapper> createState() => _TextWrapperState();
}

class _TextWrapperState extends State<TextWrapper>
    with TickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          height: isExpanded ? null : 50.h,
          duration: const Duration(milliseconds: 200),
          child: Html(
            data: widget.text,
            style: {
              // Add any custom styles here
              "body": Style(
                fontSize: FontSize(12.sp),
                color: ColorManager.grey9,
              ),
            },
          ),
          // child: HtmlWidget(
          //   widget.text,
          //   textStyle: TextStyle(
          //     fontSize: 12.sp,
          //     color: ColorManager.grey9,
          //   ),
          // ),
        ),
        isExpanded
            ? Center(
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  onTap: () => setState(() => isExpanded = false),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 7.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        color: ColorManager.white9),
                    child: Text(
                      'ViewLess'.tr,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 11.sp, color: ColorManager.grey5),
                    ),
                  ),
                ),
              )
            : Center(
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  onTap: () => setState(() => isExpanded = true),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.r, vertical: 7.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        color: ColorManager.white9),
                    child: Text(
                      'ViewMore'.tr,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 11.sp, color: ColorManager.grey5),
                    ),
                  ),
                ),
              )
      ],
    );
  }
}
