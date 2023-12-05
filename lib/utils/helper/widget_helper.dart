import 'package:base_project/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../config/config.dart';

class WidgetHelper {
  static appBar(
      {required BuildContext context,
      Function()? onTap,
      required String title,
      bool isCanBack = true}) {
    return AppBar(
      elevation: 0.5,
      shadowColor: AppColor.grayColor,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          children: [
            isCanBack
                ? Row(
                    children: [
                      GestureDetector(
                          onTap: onTap ??
                              () {
                                context.pop();
                              },
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Theme.of(context).indicatorColor,
                            size: 20.w,
                          )),
                      16.0.width,
                    ],
                  )
                : const SizedBox(),
            Expanded(
              child: Text(
                title,
                style: AppFont.semibold16
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
            ),
            24.0.width,
          ],
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      toolbarHeight: 60.h,
    );
  }
}
