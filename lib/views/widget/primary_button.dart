import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.height = 48,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    required this.onPressed,
    this.disableOnTap,
    this.disable = false,
    this.loading = false,
    this.background = AppColor.primaryColor,
    this.textColor = AppColor.textStrong,
    this.icon,
  });

  final String title;
  final double width;
  final EdgeInsets margin;
  final double height;
  final Function() onPressed;
  final Function()? disableOnTap;
  final bool disable;
  final bool loading;
  final Color background;
  final Color textColor;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height.h,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: disable ? AppColor.textSoft : background,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r))),
        onPressed: loading
            ? () {}
            : disable
                ? (disableOnTap ?? () {})
                : onPressed,
        child: loading
            ? SizedBox(
                height: 24.h,
                width: 24.h,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3.w,
                    color: textColor,
                  ),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != null
                      ? Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: icon,
                        )
                      : const SizedBox(),
                  Text(
                    title,
                    style: AppFont.medium14.copyWith(
                        color: disable ? AppColor.whiteColor : textColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
      ),
    );
  }
}
