import 'package:base_project/utils/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/config.dart';
import '../../../../../widget/widget.dart';

final obsecureProvider = StateProvider<bool>((ref) => true);
final obsecureConfirmProvider = StateProvider<bool>((ref) => true);

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool obsecure = ref.watch(obsecureProvider);
    bool obsecureConfrimm = ref.watch(obsecureConfirmProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              36.0.height,
              Text(
                "Sign Up",
                style: AppFont.semibold24
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
              8.0.height,
              Text(
                "Welcome back to this apps",
                style: AppFont.reguler14.copyWith(color: AppColor.grayColor),
              ),
              36.0.height,
              InputText(
                hintText: "Enter your full name",
                title: "Name",
                controller: nameController,
              ),
              16.0.height,
              InputText(
                hintText: "Enter your email address",
                title: "Email",
                controller: emailController,
              ),
              16.0.height,
              InputText(
                obscureText: obsecure,
                icon: GestureDetector(
                  onTap: () => ref.read(obsecureProvider.notifier).state =
                      !ref.read(obsecureProvider.notifier).state,
                  child: Icon(
                    obsecure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20.w,
                  ),
                ),
                hintText: "Enter your password",
                title: "Password",
                controller: passwordController,
              ),
              16.0.height,
              InputText(
                obscureText: obsecureConfrimm,
                icon: GestureDetector(
                  onTap: () =>
                      ref.read(obsecureConfirmProvider.notifier).state =
                          !ref.read(obsecureConfirmProvider.notifier).state,
                  child: Icon(
                    obsecureConfrimm
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20.w,
                  ),
                ),
                hintText: "Confirm your password",
                title: "ConfirmPassword",
                controller: confirmPasswordController,
              ),
              32.0.height,
              PrimaryButton(title: "Register", onPressed: () {}),
              36.0.height,
              Center(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Have an account? ",
                        style: AppFont.reguler14
                            .copyWith(color: AppColor.grayColor)),
                    TextSpan(
                        text: "Sign In",
                        style: AppFont.medium14
                            .copyWith(color: AppColor.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => ref.watch(appRouteProvider).pop())
                  ]),
                  textAlign: TextAlign.center,
                ),
              ),
              24.0.height,
            ],
          ),
        ),
      ),
    );
  }
}
