import 'package:base_project/config/config.dart';
import 'package:base_project/utils/util.dart';
import 'package:base_project/views/provider/splash/splash_provider.dart';
import 'package:base_project/views/widget/input_text.dart';
import 'package:base_project/views/widget/primary_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

final obsecureProvider = StateProvider<bool>((ref) => false);

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool obsecure = ref.watch(obsecureProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              36.0.height,
              Text(
                "Sign In",
                style: AppFont.semibold24
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
              8.0.height,
              Text(
                "Welcome back to this apps",
                style: AppFont.reguler14.copyWith(color: AppColor.grayColor),
              ),
              64.0.height,
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
              8.0.height,
              GestureDetector(
                onTap: () => context.goNamed('forgot_password'),
                child: Text(
                  'Forgot password?',
                  style:
                      AppFont.medium14.copyWith(color: AppColor.primaryColor),
                ),
              ),
              24.0.height,
              PrimaryButton(
                  title: "Login",
                  onPressed: () {
                    ref.read(checkUserProvider.notifier).changeLogin();
                  }),
              36.0.height,
              Center(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Don't have an account? ",
                        style: AppFont.reguler14
                            .copyWith(color: AppColor.grayColor)),
                    TextSpan(
                      text: "Create New Account",
                      style: AppFont.medium14
                          .copyWith(color: AppColor.primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.goNamed('register'),
                    )
                  ]),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
