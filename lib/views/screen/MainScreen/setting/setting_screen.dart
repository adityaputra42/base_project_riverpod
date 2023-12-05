import 'package:base_project/views/provider/auth/auth_provider.dart';
import 'package:base_project/views/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: PrimaryButton(
        onPressed: () {
          ref.read(logoutProvider);
        },
        title: "Log out",
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      ),
    );
  }
}
