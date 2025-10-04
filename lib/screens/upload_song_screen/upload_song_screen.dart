import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/utils/app_log.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class UploadSongScreen extends StatelessWidget {
  const UploadSongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: AppStrings.uploadNewTrack,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              AppStrings.uploadAudioFile,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 5),
            DottedBorder(
              options: RoundedRectDottedBorderOptions(
                radius: Radius.circular(15),
                color: AppColors.grey_60,
                dashPattern: [3, 2],
                padding: EdgeInsets.all(20),
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    IconWidget(icon: AppIcons.audioUploadIcon),
                    SizedBox(height: 5),
                    TextWidget(
                      AppStrings.browseSong,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white_900,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            TextWidget(
              AppStrings.trackCoverArt,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.grey_60),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconWidget(icon: AppIcons.uploadImageIcon),
                ),
                SizedBox(width: 20),
                ButtonWidget.normal(
                  text: AppStrings.chooseCover,
                  width: 150,
                  height: 40,
                  fontSize: 16,
                  backgroundColor: AppColors.orange,
                  padding: EdgeInsets.symmetric(vertical: 1),
                  onTap: () {},
                ),
              ],
            ),
            SizedBox(height: 15),
            TextWidget(
              AppStrings.genre,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                // labelText: "Select Genre",
                // labelStyle: TextStyle(color: AppColors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey_60, width: 0.2),
                  borderRadius: BorderRadius.circular(25),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey_60, width: 0.2),
                  borderRadius: BorderRadius.circular(25),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey_60, width: 0.2),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              dropdownColor: AppColors.black_600,
              value: "Select Genre",
              items: List.generate(
                3,
                (index) => index == 0
                    ? DropdownMenuItem<String>(
                        value: "Select Genre",
                        child: TextWidget("Select Genre"),
                      )
                    : DropdownMenuItem<String>(
                        value: "Genre $index",
                        child: TextWidget("Genre $index"),
                      ),
              ),
              onChanged: (value) {
                appLog(title: "Select genre", descrition: "Selected: $value");
              },
            ),
            Spacer(),
            ButtonWidget(onTap: () {}, text: AppStrings.uploadTrack),
          ],
        ),
      ),
    );
  }
}
