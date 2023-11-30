import 'package:base_project/config/config.dart';
import 'package:base_project/views/provider/splash_provider.dart';
import 'package:base_project/utils/util.dart';
import 'package:base_project/views/screen/MainScreen/main_screen.dart';
import 'package:base_project/views/widget/input_text.dart';
import 'package:base_project/views/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final obsecureProvider = StateProvider<bool>((ref) => false);

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool obsecure = ref.watch(obsecureProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              36.0.height,
              Text(
                "Login",
                style: AppFont.semibold24,
              ),
              24.0.height,
              InputText(
                hintText: "Masukan email anda",
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
                hintText: "Masukan password",
                title: "Password",
                controller: passwordController,
              ),
              32.0.height,
              PrimaryButton(
                  title: "Login",
                  onPressed: () {
                    ref.read(isLoginProvider.notifier).state = true;
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const MainScreen()),
                        (route) => false);
                  }),
              36.0.height,
            ],
          ),
        ),
      ),
    );
  }
}
