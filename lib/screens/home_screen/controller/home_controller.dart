import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/models/top_playlist_model.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/utils/app_common_function.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  final topPlayList = <TopPlaylistModel>[].obs;

  final List slotMachineItem = [
    'assets/images/seven.png',
    "assets/images/cherry.png",
    "assets/images/bell.png",
  ];
  List slotMachineTarget = [0, 0, 0].obs;
  // final rouletteController = RouletteController();

  late AnimationController rotationController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    onInitial();
  }

  void onInitial() {
    rotationController = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.normal,
      duration: const Duration(milliseconds: 500),
    );
    topPlayList.value = [
      TopPlaylistModel(
        title: 'Winter vibe 2025',
        totalSongs: "30",
        totalViews: "19.5K",
        image: AppImages.onBoardingCharacter1,
      ),
      TopPlaylistModel(
        title: 'Summer vibe 2025',
        totalSongs: "20",
        totalViews: "12.5K",
        image: AppImages.onBoardingCharacter1,
      ),
      TopPlaylistModel(
        title: 'Rainy vibe 2025',
        totalSongs: "50",
        totalViews: "18.6K",
        image: AppImages.onBoardingCharacter1,
      ),
      TopPlaylistModel(
        title: 'Cool vibe 2025',
        totalSongs: "18",
        totalViews: "14.6K",
        image: AppImages.onBoardingCharacter1,
      ),
    ];
  }

  void onSpinSlotMachine() {
    AppCommonFunction.showSnackbar(
      title: "Under Development!!!",
      text: "Please wait for the next update",
      isSuccess: false,
    );
    // slotMachineTarget = [null, null, null];

    // update();
    // final random = Random();
    // Future.delayed(Duration(seconds: 5), () {
    //   slotMachineTarget = [
    //     random.nextInt(slotMachineItem.length - 1),
    //     random.nextInt(slotMachineItem.length - 1),
    //     random.nextInt(slotMachineItem.length - 1),
    //   ];

    //   update();
    // });
  }

  void onSpinRoulette() {
    AppCommonFunction.showSnackbar(
      title: "We're still working on this!!",
      text: "Please wait for the next update",
      isSuccess: false,
    );
    rotationController.repeat();
    Future.delayed(Duration(seconds: 3), () {
      rotationController.stop();
    });
  }

  void onClickNotification() {
    Get.toNamed(AppRoutes.notificationScreen);
  }
}
