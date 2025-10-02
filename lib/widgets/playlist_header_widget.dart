import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/image_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class PlaylistHeaderWidget extends StatelessWidget {
  const PlaylistHeaderWidget({
    super.key,
    required this.playlistName,
    required this.numberOfSong,
    required this.duration,
    required this.viewer,
    required this.owner,
    required this.image,
    this.imageHeight,
    this.imageWidth,
    this.fit = BoxFit.cover,
    this.gradient,
  });
  final String playlistName;
  final String numberOfSong;
  final String duration;
  final String viewer;
  final String owner;
  final String image;
  final double? imageHeight;
  final double? imageWidth;
  final BoxFit? fit;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(15),
          child: SizedBox(
            height: 240,
            width: double.infinity,
            child: ImageWidget(
              image: image,
              width: imageWidth,
              height: imageHeight,
              fit: fit,
            ),
          ),
        ),
        Container(
          height: 240,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient:
                gradient ??
                LinearGradient(
                  colors: [Colors.transparent, AppColors.black],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                ),
          ),
        ),

        Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonWidget.icon(
                icon: AppIcons.playBlackIcon,
                backgroundColor: AppColors.orange,
                onTap: () {},
              ),
              SizedBox(height: 5),
              TextWidget(playlistName),
              SizedBox(height: 4),
              Row(
                children: [
                  IconWidget(icon: AppIcons.musicIconOutline),
                  TextWidget(
                    '$numberOfSong Songs',
                    color: AppColors.white_900,
                    fontSize: 12,
                  ),
                  SizedBox(width: 5),
                  IconWidget(icon: AppIcons.timerIcon),
                  TextWidget(
                    duration,
                    color: AppColors.white_900,
                    fontSize: 12,
                  ),
                  SizedBox(width: 5),
                  IconWidget(icon: AppIcons.playIconOutline),
                  TextWidget(viewer, color: AppColors.white_900, fontSize: 12),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  TextWidget(
                    'Created by',
                    fontSize: 12,
                    color: AppColors.white_900,
                  ),
                  SizedBox(width: 4),
                  TextWidget(owner, fontWeight: FontWeight.w700, fontSize: 12),
                  // Spacer(),
                  // IconWidget(icon: AppIcons.downloadIcon),
                  // SizedBox(width: 5),
                  // IconWidget(icon: AppIcons.shareIcon),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
