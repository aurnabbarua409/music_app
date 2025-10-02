import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/new_playlist_screen/controller/new_playlist_controller.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/playlist_header_widget.dart';
import 'package:music_app/widgets/text_widget.dart';
import 'package:music_app/widgets/type_selector_widget.dart';

class NewPlaylistScreen extends StatelessWidget {
  const NewPlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NewPlaylistController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.white,
            title: Text(AppStrings.playlist),
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonWidget.icon(
                icon: AppIcons.arrowLeftIcon,
                backgroundColor: Colors.transparent,
                cardColor: Colors.transparent,
                onTap: controller.onBack,
              ),
            ),

            actions: [
              ButtonWidget.icon(
                icon: AppIcons.moreCircleIcon,
                backgroundColor: Colors.transparent,
                cardColor: Colors.transparent,
                onTap: () {},
              ),
            ],
            actionsPadding: EdgeInsets.only(right: 10),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              children: [
                PlaylistHeaderWidget(
                  playlistName: controller.playListName.value,
                  numberOfSong: "0",
                  duration: "0h 0m",
                  viewer: "0K",
                  owner: "you",
                  image: AppIcons.musicIcon4,
                  imageWidth: 72,
                  imageHeight: 72,
                  fit: null,
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(36, 0, 0, 0),
                      AppColors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    IconWidget(
                      icon: AppIcons.loveIcon,
                      color: AppColors.white_900,
                    ),
                    SizedBox(width: 4),
                    TextWidget(
                      "0",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white_900,
                    ),
                    SizedBox(width: 4),
                    IconWidget(
                      icon: AppIcons.commentIcon,
                      color: AppColors.white_900,
                    ),
                    SizedBox(width: 4),
                    TextWidget(
                      "0",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white_900,
                    ),
                    Spacer(),
                    IconWidget(
                      icon: AppIcons.downloadIcon,
                      color: AppColors.white_900,
                      scale: 0.8,
                    ),
                    SizedBox(width: 4),
                    IconWidget(
                      icon: AppIcons.shareIcon,
                      scale: 0.8,
                      color: AppColors.white_900,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TypeSelectorWidget(
                  value: controller.isSong.value,
                  onChanged: (value) => controller.onChange(value),
                  firstText: AppStrings.songs,
                  lastText: AppStrings.info,
                  firstIcon: AppIcons.songIcon,
                  lastIcon: AppIcons.infoIcon,
                  height: 56,
                ),
                SizedBox(height: 20),
                ButtonWidget(
                  onTap: controller.onAddSong,
                  text: "+ Add Song to this playlist",
                  backgroundColor: Colors.transparent,
                  elevation: 6,
                  cardColor: Colors.transparent,
                  glassColor: Colors.transparent,
                  borderColor: AppColors.white,
                  color: AppColors.orange,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
