import 'package:base_project/config/theme/app_font.dart';
import 'package:base_project/utils/util.dart';
import 'package:base_project/views/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

final onBoardingProvider = StateProvider<int>((ref) => 0);

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(onBoardingProvider);
    return Scaffold(
      bottomNavigationBar: PrimaryButton(
          margin: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
          title: index < 2 ? "Next" : "Get Started",
          onPressed: () {
            if (index < 2) {
              ref.read(onBoardingProvider.notifier).state += 1;
            } else {
              PrefHelper.instance.setFirstInstall();
            context.goNamed('login');
            }
          }),
      body: Center(
        child: Text(
          "onboarding ${index + 1}",
          style: AppFont.semibold20,
        ),
      ),
    );
  }
}
