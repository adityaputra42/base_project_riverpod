import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';

class CustomTabBar extends StatelessWidget {
  final int? selectedIndex;
  final List<String> titles;
  final Function(int)? onTap;
  final double fonsize;

  const CustomTabBar({
    Key? key,
    required this.titles,
    this.selectedIndex,
    this.fonsize = 14,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: titles
          .map((e) => GestureDetector(
                onTap: () {
                  if (onTap != null) {
                    onTap!(titles.indexOf(e));
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    right: e == titles.last ? 0 : 16.w,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 10.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                                width: 1.h,
                                color: titles.indexOf(e) == selectedIndex
                                    ? AppColor.primaryColor
                                    : AppColor.textSoft),
                            color: titles.indexOf(e) == selectedIndex
                                ? AppColor.secondaryColor
                                : Colors.transparent),
                        child: Text(
                          e,
                          style: AppFont.medium14.copyWith(
                            color: titles.indexOf(e) == selectedIndex
                                ? AppColor.textStrong
                                : AppColor.textSoft,
                            fontSize: fonsize.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
