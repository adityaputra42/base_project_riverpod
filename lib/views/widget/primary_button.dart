import 'package:base_project/utils/util.dart';
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
    this.disable = false,
    this.activeColor = AppColor.primaryColor,
    this.disableColor = AppColor.grayColor,
    this.icon,
    this.loading = false,
  });

  final String title;
  final double width;
  final EdgeInsets margin;
  final double height;
  final Function() onPressed;
  final Color activeColor;
  final Color disableColor;
  final bool disable;
  final bool loading;
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
            backgroundColor: disable ? disableColor : activeColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r))),
        onPressed: disable || loading ? () {} : onPressed,
        child: loading
            ? Padding(
                padding: EdgeInsets.all(8.h),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.secondaryColor,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox(),
                  icon != null ? 8.0.width : 0.0.width,
                  Text(
                    title,
                    style: AppFont.medium16.copyWith(color: AppColor.textLight),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
      ),
    );
  }
}
