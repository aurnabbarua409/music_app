import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/now_playing_screen/widgets/now_playing_button_widget.dart';
import 'package:music_app/utils/app_log.dart';
import 'package:music_app/widgets/image_widget.dart';
import 'package:music_app/widgets/play_list_item.dart';
import 'package:music_app/widgets/text_widget.dart';

class NowPlayingController extends GetxController
    with GetTickerProviderStateMixin {
  final progress = 0.0.obs;
  final totalTime = 300.obs;
  late AudioPlayer player;
  final isPlaying = true.obs;
  final isRepeating = false.obs;
  final audioSource = "audio/cloudburst-by-audio-club-352202.mp3";

  late AnimationController rotationController;

  void onInitial() {
    try {
      appLog(title: 'Now playing screen', descrition: "initialized");
      player = AudioPlayer();
      onPlay();

      //for rotation
      rotationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 20),
      );

      // Listen to isPlaying to start/stop rotation
      ever(isPlaying, (playing) {
        if (playing == true) {
          rotationController.repeat();
        } else {
          rotationController.stop();
        }
      });
      if (isPlaying.value) {
        rotationController.repeat();
      }
    } catch (e) {
      appLog(title: "Now playing screen", descrition: e);
    }
  }

  void onDispose() {
    appLog(title: 'Now playing screen', descrition: "disposed");
    player.dispose();
    rotationController.dispose();
  }

  String formatDuration(int seconds) {
    final d = Duration(seconds: seconds.toInt());
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final secs = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  void onProgressChange(double value) {
    progress.value = value;
    player.seek(Duration(seconds: value.toInt()));
    appLog(
      title: 'In now playing screen',
      descrition: "music progress: ${progress.value}",
    );
  }

  void onGetback() {
    Get.back();
  }

  void onClickMore() {
    Get.bottomSheet(
      elevation: 6,
      backgroundColor: AppColors.black_700,
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Row(
              children: [
                ImageWidget(
                  image: AppImages.onBoardingCharacter1,
                  fit: BoxFit.cover,
                  height: 43,
                  width: 43,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      'Young',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    TextWidget(
                      'The Chainsmokers',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white_900,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(color: AppColors.white),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
              top: 10,
            ),
            child: Column(
              children: [
                NowPlayingButtonWidget(
                  icon: AppIcons.shareIcon,
                  text: AppStrings.share,
                  ontap: () {},
                ),
                NowPlayingButtonWidget(
                  icon: AppIcons.addCircleIcon,
                  text: AppStrings.addYourPlaylist,
                  ontap: () {},
                ),
                NowPlayingButtonWidget(
                  icon: AppIcons.profileIcon,
                  text: AppStrings.goCreatorProfile,
                  ontap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onClickQueue() {
    Get.bottomSheet(
      backgroundColor: AppColors.black_700,
      Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              AppStrings.queue,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => PlayListItem(
                  isPlaying: false,
                  title: "Young",
                  subtitle: "Subtitle",
                  image: AppImages.music1Image,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPlay() async {
    await player.play(
      volume: 1,
      balance: 0.0,
      AssetSource(audioSource),
      mode: PlayerMode.mediaPlayer,
    );
    await player.getDuration().then(
      (value) => totalTime.value = value!.inSeconds,
    );
    player.onPositionChanged.listen((Duration p) {
      progress.value = p.inSeconds.toDouble();
      if (progress.value == totalTime.value && !isRepeating.value) {
        isPlaying.value = false;
      }
      // appLog(title: 'Audio Progress', descrition: '${progress.value}s');
    });
  }

  void onResume() async {
    isPlaying.value = true;
    if (progress.value == totalTime.value) {
      onPlay();
      return;
    }

    try {
      appLog(title: "Resume button", descrition: "CLicked");
      appLog(title: "Asset source", descrition: audioSource);
      player.resume();
    } catch (e) {
      appLog(title: 'In now playing screen after playing', descrition: e);
    }
  }

  void onPause() async {
    appLog(title: "Pause button", descrition: "CLicked");

    isPlaying.value = false;
    await player.pause();
  }

  void onGoForward() async {
    final current = await player.getCurrentPosition();
    if (current != null) {
      player.seek(current + const Duration(seconds: 10));
    }
  }

  void onGoBackward() async {
    final current = await player.getCurrentPosition();
    if (current != null) {
      final newPosition = current - const Duration(seconds: 10);
      player.seek(newPosition > Duration.zero ? newPosition : Duration.zero);
    }
  }

  void onRepeat() {
    if (isRepeating.value) {
      player.setReleaseMode(ReleaseMode.release);
      isRepeating.value = false;
      appLog(title: "Repeat", descrition: "Repeat turned OFF");
    } else {
      player.setReleaseMode(ReleaseMode.loop);
      isRepeating.value = true;
      appLog(title: "Repeat", descrition: "Repeat turned ON");
    }
  }
}
