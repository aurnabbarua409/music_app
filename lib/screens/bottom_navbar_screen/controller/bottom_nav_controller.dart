import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/screens/bottom_navbar_screen/widgets/bordered_icon_widget.dart';
import 'package:music_app/screens/home_screen/home_screen.dart';
import 'package:music_app/screens/playlist_screen/playlist_screen.dart';
import 'package:music_app/utils/app_log.dart';
import 'package:music_app/widgets/text_widget.dart';

class BottomNavController extends GetxController {
  final selectedIndex = 0.obs;

  final List<Widget> pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  void onNavItemTapped(int index) {
    appLog(title: 'bottombav bar', descrition: "selected index: $index");
    if (index == 2) {
      onCreateNew();
    } else {
      selectedIndex.value = index;
    }
  }

  void onCreateNew() {
    Get.bottomSheet(
      backgroundColor: AppColors.black_700,
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Get.back();
                Get.toNamed(AppRoutes.createNewPlaylist);
              },
              child: Row(
                children: [
                  BorderedIconWidget(icon: AppIcons.musicIcon2),
                  SizedBox(width: 10),
                  TextWidget(
                    AppStrings.createYourPlaylist,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.fadeWhite,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                BorderedIconWidget(icon: AppIcons.uploadIcon),
                SizedBox(width: 10),
                TextWidget(
                  AppStrings.uploadSong,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.fadeWhite,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
