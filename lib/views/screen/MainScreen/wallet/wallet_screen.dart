import 'package:base_project/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(24.w),
              padding: EdgeInsets.all(16.w),
              width: double.infinity,
              height: 200.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  gradient: const LinearGradient(colors: [
                    AppColor.grayColor,
                    AppColor.cardDark,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            )
          ],
        ),
      ),
    );
  }
}
