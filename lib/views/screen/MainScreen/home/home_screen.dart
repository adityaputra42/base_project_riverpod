import 'package:base_project/config/config.dart';
import 'package:base_project/data/src/app_image.dart';
import 'package:base_project/utils/util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final listImage = Provider<List<String>>((ref) => [
      "https://i.pinimg.com/474x/ec/a3/1a/eca31a14fdd6c131f70858591b4397f9.jpg",
      "https://wallpapersmug.com/download/1920x1080/a1c695/hong-kong-cityscape-night-art.jpg",
      "https://images2.alphacoders.com/111/1118834.png",
      "https://a-static.besthdwallpaper.com/night-city-buildings-art-wallpaper-1440x900-81172_4.jpg",
      "https://e0.pxfuel.com/wallpapers/115/415/desktop-wallpaper-linked-city-fantsy-abstract.jpg"
    ]);

final indexCarouselProvider = StateProvider<int>((ref) => 0);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          header(context),
          Expanded(
            child: ListView(
              children: [
                8.0.height,
                overview(),
                8.0.height,
                listFavorite(context),
                16.0.height,
                listRecomended(context),
                12.0.height,
              ],
            ),
          )
        ]),
      ),
    );
  }

  Padding listRecomended(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recomended",
            style: AppFont.medium16
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
          8.0.height,
          Column(
            children: List.generate(
                ref.watch(listImage).length,
                (index) => Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.r),
                            child: Image.network(
                              ref.watch(listImage)[index],
                              height: 60.h,
                              width: 60.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          12.0.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Aesthetic",
                                style: AppFont.medium16.copyWith(
                                    color: Theme.of(context).indicatorColor),
                              ),
                              4.0.height,
                              Text(
                                "Wallpaper aesthetic hd for pc",
                                style: AppFont.reguler12
                                    .copyWith(color: AppColor.grayColor),
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }

  Column listFavorite(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            "Favorite",
            style: AppFont.medium16
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
        ),
        8.0.height,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                ref.watch(listImage).length,
                (index) => Container(
                      width: 180.w,
                      height: 200.h,
                      margin: EdgeInsets.only(
                          right: index ==
                                  ref
                                      .watch(listImage)
                                      .indexOf(ref.watch(listImage).last)
                              ? 24.w
                              : 12.w,
                          left: index ==
                                  ref
                                      .watch(listImage)
                                      .indexOf(ref.watch(listImage).first)
                              ? 24.w
                              : 0),
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.r),
                            child: Image.network(
                              ref.watch(listImage)[index],
                              height: 130.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          8.0.height,
                          Text(
                            "Aesthetic",
                            style: AppFont.medium16.copyWith(
                                color: Theme.of(context).indicatorColor),
                          ),
                          4.0.height,
                          Text(
                            "Wallpaper aesthetic hd for pc",
                            style: AppFont.reguler12
                                .copyWith(color: AppColor.grayColor),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    )),
          ),
        )
      ],
    );
  }

  Column overview() {
    return Column(
      children: [
        CarouselSlider(
            items: List.generate(
                ref.watch(listImage).length,
                (index) => Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 24.w, vertical: 1.h),
                      width: double.infinity,
                      height: 200.h,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 0.5.w,
                                blurRadius: 0.3.w,
                                color: Colors.white12)
                          ],
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(8.r),
                          image: DecorationImage(
                              image: NetworkImage(ref.watch(listImage)[index]),
                              fit: BoxFit.cover)),
                    )),
            options: CarouselOptions(
                height: 202.h,
                viewportFraction: 1,
                autoPlay: true,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  ref.read(indexCarouselProvider.notifier).state = index;
                })),
        8.0.height,
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(ref.watch(listImage).length, (indexValue) {
              int index = indexValue - 1;
              index++;
              return indicator(index);
            }))
      ],
    );
  }

  Widget indicator(int index) {
    return Container(
      width: ref.watch(indexCarouselProvider) == index ? 40.w : 8.w,
      height: 8.w,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          color: ref.watch(indexCarouselProvider) == index
              ? AppColor.primaryColor
              : AppColor.grayColor,
          borderRadius: BorderRadius.circular(3.w)),
    );
  }

  Widget header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        children: [
          Container(
            width: 48.w,
            height: 48.w,
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
                border: Border.all(width: 1.w, color: AppColor.primaryColor),
                shape: BoxShape.circle),
            child: Container(
              padding: EdgeInsets.all(8.h),
              decoration: const BoxDecoration(
                  color: AppColor.primaryColor, shape: BoxShape.circle),
              child: Center(child: Image.asset(AppImage.avatar)),
            ),
          ),
          8.0.width,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Wellcom Back!",
                style: AppFont.reguler14.copyWith(color: AppColor.grayColor),
              ),
              1.0.height,
              Text(
                "John Doe",
                style: AppFont.medium14
                    .copyWith(color: Theme.of(context).indicatorColor),
              )
            ],
          )),
          Icon(
            Icons.notifications,
            size: 24.w,
            color: Theme.of(context).indicatorColor,
          )
        ],
      ),
    );
  }
}
