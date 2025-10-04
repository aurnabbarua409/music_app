import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/image_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class EditPlaylistScreen extends StatelessWidget {
  const EditPlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: AppStrings.editPlayList,
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            5,
            (index) => Card(
              elevation: 6,
              color: Colors.transparent,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey_60, width: 0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    IconWidget(icon: AppIcons.minusIcon),
                    SizedBox(width: 10),
                    ImageWidget(
                      image: AppImages.music1Image,
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextWidget(
                          "Young",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        TextWidget(
                          "The Chainsmoker",
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white_900,
                        ),
                      ],
                    ),
                    Spacer(),
                    IconWidget(icon: AppIcons.menuIcon),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
