import 'package:base_project/config/config.dart';
import 'package:base_project/views/screen/MainScreen/history/history_screen.dart';
import 'package:base_project/views/screen/MainScreen/home/home_screen.dart';
import 'package:base_project/views/screen/MainScreen/setting/setting_screen.dart';
import 'package:base_project/views/screen/MainScreen/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final bottomNavBarProvider = Provider<List<dynamic>>((ref) => [
      {"label": "Home", "icon": Icons.home_rounded},
      {"label": "History", "icon": Icons.history_rounded},
      {"label": "Wallet", "icon": Icons.wallet_outlined},
      {"label": "Setting", "icon": Icons.settings_rounded},
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
          return const HomeScreen();
        case 1:
          return const HistoryScreen();
        case 2:
          return const WalletScreen();
        case 3:
          return const SettingScreen();

        default:
          return const HomeScreen();
      }
    }

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r)),
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
              backgroundColor: Theme.of(context).cardColor,
              selectedItemColor: AppColor.primaryColor,
              iconSize: 24.h,
              selectedLabelStyle: AppFont.semibold14,
              unselectedLabelStyle: AppFont.reguler14,
              unselectedItemColor: AppColor.grayColor,
            ),
          ),
        ),
        body: body());
  }
}
