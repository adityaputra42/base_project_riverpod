import 'dart:async';

import 'package:base_project/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../provider/splash/splash_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      if (ref.watch(newUserProvider) == true) {
        context.goNamed('onboarding');
      } else {
        if (ref.watch(checkUserProvider) == true) {
          context.goNamed('main');
        } else {
          context.goNamed('login');
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
