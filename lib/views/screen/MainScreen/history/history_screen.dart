import 'package:base_project/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/widget.dart';

final indexTabProvider = StateProvider<int>((ref) => 0);

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(
          context: context, title: "History Activity", isCanBack: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            24.0.height,
            CustomTabBar(
              titles: const ["Main Lagi", "Coba Lagi", "Mana Lagi"],
              selectedIndex: ref.watch(indexTabProvider),
              onTap: (index) {
                ref.read(indexTabProvider.notifier).state = index;
              },
            ),
            const Expanded(child: Empty(title: "Data Not Found"))
          ],
        ),
      ),
    );
  }
}
