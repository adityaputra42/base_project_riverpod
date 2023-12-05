import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/util.dart';
import '../../../../../widget/widget.dart';

final obsecureProvider = StateProvider<bool>((ref) => true);
final obsecureConfirmProvider = StateProvider<bool>((ref) => true);

class ResetPasswordScreen extends ConsumerWidget {
  ResetPasswordScreen({super.key});
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool obsecure = ref.watch(obsecureProvider);
    bool obsecureConfrimm = ref.watch(obsecureConfirmProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(context: context, title: "Reset password"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
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
                onTap: () => ref.read(obsecureConfirmProvider.notifier).state =
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
          ],
        ),
      ),
    );
  }
}
