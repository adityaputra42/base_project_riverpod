import 'package:base_project/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';

class WidgetHelper {
  static appBar({
    required BuildContext context,
    Function()? onTap,
    required String title,
    
  }) {
    return AppBar(
      elevation: 0,
      title: Row(
        children: [
          GestureDetector(
              onTap: onTap ??
                  () {
                    Navigator.pop(context);
                  },
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColor.textStrong,
                size: 24.w,
              )),
          16.0.width,
          Expanded(
            child: Text(
              title,
              style: AppFont.semibold16,
              textAlign: TextAlign.center,
            ),
          ),
          24.0.width,
        ],
      ),
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.primaryColor,
      toolbarHeight: 60.h,
    );
  }
}
