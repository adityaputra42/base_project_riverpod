import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.title,
    this.height = 48,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    this.borderColor = AppColor.textStrong,
    this.textColor = AppColor.textStrong,
    this.backgroundColor,
    this.fontSize = 14,
    this.icon,
    this.isloading = false,
    required this.onPressed,
  });

  final String title;
  final double width;
  final double fontSize;
  final EdgeInsets margin;
  final double height;
  final Color borderColor;
  final Color textColor;
  final bool isloading;
  final Widget? icon;
  final Color? backgroundColor;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      width: width,
      height: height.h,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            side: BorderSide(width: 1.h, color: borderColor),
            backgroundColor: backgroundColor ?? AppColor.whiteColor,
            // const Color(0xffD2F1FF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r))),
        onPressed: isloading == true ? () {} : onPressed,
        child: isloading == true
            ? SizedBox(
                height: 32.h,
                width: 32.h,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3.w,
                    color: textColor,
                  ),
                ),
              )
            : Row(
                children: [
                  icon ?? const SizedBox(),
                  Expanded(
                    child: Text(
                      title,
                      style: AppFont.medium14
                          .copyWith(color: textColor, fontSize: fontSize.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
