import 'package:base_project/config/config.dart';
import 'package:base_project/views/screen/MainScreen/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final bottomNavBarProvider = Provider<List<dynamic>>((ref) => [
      {"label": "Home", "icon": Icons.home_rounded},
      {"label": "Market", "icon": Icons.equalizer_rounded},
      {"label": "Wallet", "icon": Icons.wallet_rounded},
      {"label": "Profile", "icon": Icons.person},
    ]);

final indexNavBarProvider = StateProvider<int>((ref) => 0);

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var item = ref.watch(bottomNavBarProvider);

    body() {
      switch (ref.watch(indexNavBarProvider)) {
        case 0:
          return const Center(
            child: Text("Home Screen"),
          );
        case 1:
          return const Center(
            child: Text("Market Screen"),
          );
        case 2:
          return const Center(
            child: Text("Wallet Screen"),
          );
        case 3:
          return ProfileScreen();

        default:
          return const Center(
            child: Text("Home Screen"),
          );
      }
    }

    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r)),
          child: SizedBox(
            height: 72.h,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: item
                  .map((e) => BottomNavigationBarItem(
                      activeIcon: Padding(
                        padding: EdgeInsets.all(4.h),
                        child: Icon(e['icon']),
                      ),
                      icon: Padding(
                        padding: EdgeInsets.all(4.h),
                        child: Icon(e['icon']),
                      ),
                      label: e["label"]))
                  .toList(),
              elevation: 3,
              currentIndex: ref.watch(indexNavBarProvider),
              onTap: (value) =>
                  ref.read(indexNavBarProvider.notifier).state = value,
              backgroundColor: AppColor.whiteColor,
              selectedItemColor: AppColor.primaryColor,
              iconSize: 28.h,
              selectedLabelStyle: AppFont.semibold14,
              unselectedLabelStyle: AppFont.reguler14,
              unselectedItemColor: AppColor.textSoft,
            ),
          ),
        ),
        body: body());
  }
}
