import 'dart:async';

import 'package:base_project/config/config.dart';
import 'package:base_project/views/provider/splash_provider.dart';
import 'package:base_project/views/screen/MainScreen/main_screen.dart';
import 'package:base_project/views/screen/auth/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../login/login_screen.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    ref.read(isNewUseProvider.notifier).checkFirstInstall();
    Timer(const Duration(seconds: 5), () {
      if (ref.read(isNewUseProvider) == false) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
            (route) => false);
      } else {
        if (ref.read(isLoginProvider) == true) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MainScreen()),
              (route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Icon(
          Icons.chat_rounded,
          size: 48.w,
          color: AppColor.whiteColor,
        ),
      ),
    );
  }
}
