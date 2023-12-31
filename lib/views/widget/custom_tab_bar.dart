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
          .map((e) => Padding(
                padding: EdgeInsets.only(left: (e == titles.first ? 0 : 8.w)),
                child: GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap!(titles.indexOf(e));
                    }
                  },
                  child: Container(
                    height: 36.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: titles.indexOf(e) == selectedIndex
                            ? AppColor.primaryColor
                            : Colors.transparent,
                        border: Border.all(
                            width: 1.h, color: AppColor.primaryColor)),
                    child: Center(
                      child: Text(
                        e,
                        style: (titles.indexOf(e) == selectedIndex
                            ? AppFont.medium14
                                .copyWith(color: AppColor.textLight)
                            : AppFont.reguler14.copyWith(
                                color: Theme.of(context).indicatorColor)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
