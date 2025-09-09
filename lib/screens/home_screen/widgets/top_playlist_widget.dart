import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class TopPlaylistWidget extends StatelessWidget {
  const TopPlaylistWidget({super.key, required this.icon, required this.title});
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconWidget(icon: icon),
            SizedBox(width: 5),
            TextWidget(title, fontSize: 22, fontWeight: FontWeight.w700),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 176,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AppImages.onBoardingCharacter1,
                        fit: BoxFit.cover,
                        width: 160,
                        height: 176,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.transparent, AppColor.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              'Aurnab vibe 2025',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            Row(
                              children: [
                                IconWidget(icon: AppIcons.musicIconOutline),
                                TextWidget(
                                  '8 songs',
                                  color: AppColor.white_900,
                                  fontSize: 11,
                                ),
                                SizedBox(width: 3),
                                IconWidget(icon: AppIcons.playIconOutline),
                                TextWidget(
                                  '12.5M',
                                  color: AppColor.white_900,
                                  fontSize: 11,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
