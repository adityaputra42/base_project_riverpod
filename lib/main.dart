import 'package:base_project/views/screen/auth/splahScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/config.dart';
import 'utils/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PrefHelper.instance.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Builder(builder: (context) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Base project',
              theme: Styles.themeData(false, context),
              home: const SplashScreen(),
            );
          });
        });
  }
}
