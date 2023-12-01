
import 'package:base_project/views/screen/auth/splahScreen/splash_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../views/screen/MainScreen/main_screen.dart';
import '../../views/screen/auth/login/component/forgot_password/forgot_password_screen.dart';
import '../../views/screen/auth/login/component/register/register_screen.dart';
import '../../views/screen/auth/login/login_screen.dart';
import '../../views/screen/auth/onboarding/onboarding_screen.dart';
part 'app_route.g.dart';

@riverpod
GoRouter appRoute(AppRouteRef ref) {
  return GoRouter(routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),
    GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => LoginScreen(),
        routes: [
          GoRoute(
            path: 'forgot_password',
            name: 'forgot_password',
            builder: (context, state) => const ForgotPasswordScreen(),
          ),
          GoRoute(
            path: 'register',
            name: 'register',
            builder: (context, state) => const RegisterScreen(),
          ),
        ]),
    GoRoute(
      path: '/main',
      name: 'main',
      builder: (context, state) => const MainScreen(),
    ),
  ], initialLocation: '/', debugLogDiagnostics: true);
}
