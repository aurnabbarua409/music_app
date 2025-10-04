import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/liked_song_screen/controller/liked_song_controller.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/play_list_item.dart';

class LikedSongScreen extends StatelessWidget {
  const LikedSongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LikedSongController(),
      builder: (controller) {
        return AppbarWidget(
          title: controller.title.value,
          body: Column(
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PlayListItem(
                  isPlaying: false,
                  title: "Young",
                  showMore: false,
                  subtitle: "The Chainsmoker",
                  image: AppImages.music1Image,
                  backgroundColor: Colors.transparent,
                  borderColor: AppColors.grey_60,
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
