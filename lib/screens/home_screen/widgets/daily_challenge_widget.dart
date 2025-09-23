import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class DailyChallengeWidget extends StatelessWidget {
  const DailyChallengeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      child:
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.grey_800,
              // border: Border.all(color: AppColors.grey_60),
              borderRadius: BorderRadius.circular(20),
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconWidget(icon: AppIcons.musicIcon1),
                    SizedBox(width: 5),
                    TextWidget(
                      AppStrings.dailyChallenge,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                TextWidget(
                  AppStrings.add3SongstoPlaylist,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white_900,
                ),
                SizedBox(height: 6),
                LinearProgressIndicator(value: 0.3, color: AppColors.orange),
                SizedBox(height: 6),
                TextWidget(
                  '1/3 Completed',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.orange,
                ),
              ],
            ),
          ).asGlass(
            tintColor: Colors.transparent,
            clipBorderRadius: BorderRadius.circular(20),
          ),
    );
  }
}
