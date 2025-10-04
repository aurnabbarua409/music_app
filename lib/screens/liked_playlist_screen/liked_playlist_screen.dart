import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/image_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class LikedPlaylistScreen extends StatelessWidget {
  const LikedPlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: AppStrings.likedPlaylist,
      body: Column(
        children: List.generate(
          5,
          (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey_60, width: 0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.infinity,
            child: Row(
              children: [
                ImageWidget(
                  image: AppImages.music1Image,
                  height: 50,
                  width: 50,
                ),
                SizedBox(width: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      "Summer Vibes 2025",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        IconWidget(icon: AppIcons.musicIconOutline, scale: 1.2),
                        SizedBox(width: 0.5),
                        TextWidget(
                          "8 Songs",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white_900,
                        ),
                        SizedBox(width: 5),
                        IconWidget(
                          icon: AppIcons.loveIcon,
                          scale: 1.3,
                          color: AppColors.white_900,
                        ),
                        SizedBox(width: 2),
                        TextWidget(
                          "122",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white_900,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                ButtonWidget.icon(
                  icon: AppIcons.playBlackIcon,
                  backgroundColor: AppColors.orange,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
