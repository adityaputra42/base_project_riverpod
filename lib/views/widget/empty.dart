import 'package:flutter/material.dart';

import '../../config/config.dart';

class Empty extends StatelessWidget {
  const Empty({super.key, required this.title, this.width = 120});
  final String title;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image.asset(
          //   AppImage.empty,
          //   width: width.w,
          // ),
          // 8.0.height,
          Text(
            title,
            style: AppFont.medium14.copyWith(color: AppColor.primaryColor),
          )
        ],
      ),
    );
  }
}
