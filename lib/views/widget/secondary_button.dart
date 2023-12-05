import 'package:base_project/utils/util.dart';
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
    this.icon,
    required this.onPressed,
  });

  final String title;
  final double width;
  final EdgeInsets margin;
  final double height;
  final Widget? icon;
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
            side: BorderSide(width: 1.h, color: AppColor.primaryColor),
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r))),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            icon != null ? 8.0.width : 0.0.width,
            Text(
              title,
              style: AppFont.medium14.copyWith(color: AppColor.primaryColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
