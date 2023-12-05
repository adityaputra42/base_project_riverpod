import 'package:base_project/config/config.dart';
import 'package:base_project/utils/util.dart';
import 'package:base_project/views/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends ConsumerWidget {
  ForgotPasswordScreen({super.key});
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(context: context, title: "Forgot password"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.0.height,
            Text(
              'Please enter your email to reset your password',
              style: AppFont.medium14
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            24.0.height,
            InputText(
              title: "Email",
              hintText: "Enter your email address",
              controller: emailController,
            ),
            32.0.height,
            PrimaryButton(
                title: 'Confirm',
                onPressed: () {
                  context.goNamed('reset_password');
                }),
            24.0.height,
          ],
        ),
      ),
    );
  }
}
