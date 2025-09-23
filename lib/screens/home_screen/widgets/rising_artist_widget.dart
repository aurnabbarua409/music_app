import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class RisingArtistWidget extends StatelessWidget {
  const RisingArtistWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconWidget(icon: AppIcons.microphoneIcon),
            SizedBox(width: 5),
            TextWidget(
              AppStrings.risingArtist,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 140,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    Card(
                      elevation: 6,
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(100),
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          AppImages.onBoardingCharacter1,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextWidget(
                      'Aurnab',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white_900,
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
