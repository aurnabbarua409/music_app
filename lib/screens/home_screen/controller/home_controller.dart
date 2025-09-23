import 'dart:math';

import 'package:get/get.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/models/top_playlist_model.dart';
import 'package:roulette/roulette.dart';

class HomeController extends GetxController {
  final topPlayList = <TopPlaylistModel>[].obs;

  final List slotMachineItem = [
    'assets/images/seven.png',
    "assets/images/cherry.png",
    "assets/images/bell.png",
  ];
  List slotMachineTarget = [0, 0, 0].obs;
  final rouletteController = RouletteController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    onInitial();
  }

  void onInitial() {
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
    slotMachineTarget = [null, null, null];
    update();
    final random = Random();
    Future.delayed(Duration(seconds: 5), () {
      slotMachineTarget = [
        random.nextInt(slotMachineItem.length - 1),
        random.nextInt(slotMachineItem.length - 1),
        random.nextInt(slotMachineItem.length - 1),
      ];
      update();
    });
  }

  void onSpinRoulette() {
    rouletteController.rollTo(1);
  }
}
