import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/screens/library_screen/widget/library_item.dart';
import 'package:music_app/widgets/appbar_widget.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: AppStrings.yourLibrary,
      body: Column(
        children: [
          Row(
            children: [
              LibraryItem(
                icon: AppIcons.loveIcon,
                title: AppStrings.likedSong,
                subtitle: "120 Song",
                ontap: () {
                  Get.toNamed(
                    AppRoutes.likedSongScreen,
                    arguments: AppStrings.likedSong,
                  );
                },
              ),
              LibraryItem(
                icon: AppIcons.downloadIcon2,
                title: AppStrings.downloads,
                subtitle: "210 Songs",
                scale: 1,
                ontap: () {
                  Get.toNamed(
                    AppRoutes.likedSongScreen,
                    arguments: AppStrings.downloads,
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              LibraryItem(
                icon: AppIcons.playListIcon,
                title: AppStrings.myPlaylists,
                subtitle: "12 playlist",
                scale: 1,
                ontap: () {
                  Get.toNamed(
                    AppRoutes.likedSongScreen,
                    arguments: AppStrings.myPlaylist,
                  );
                },
              ),
              LibraryItem(
                icon: AppIcons.musicIcon2,
                title: AppStrings.myListings,
                subtitle: "30 Song",
                ontap: () {
                  Get.toNamed(
                    AppRoutes.likedSongScreen,
                    arguments: AppStrings.myListings,
                  );
                },
              ),
            ],
          ),

          Row(
            children: [
              LibraryItem(
                icon: AppIcons.playListIcon,
                title: AppStrings.likedPlaylist,
                subtitle: "120 playlist",
                scale: 1,
                ontap: () {
                  Get.toNamed(AppRoutes.likedPlaylistScreen);
                },
              ),
              Expanded(child: SizedBox(width: double.infinity)),
            ],
          ),
        ],
      ),
    );
  }
}
