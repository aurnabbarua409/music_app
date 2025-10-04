import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/play_list_item.dart';
import 'package:music_app/widgets/text_field_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class AddThisPlaylist extends StatelessWidget {
  const AddThisPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: "Add To This Playlist",
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextFieldWidget(
              hintText: AppStrings.search,
              labelFontSize: 20,
              labelFontweight: FontWeight.w700,
              labelColor: AppColors.white,
              borderRadius: 12,
              borderWidth: 0.2,
              backgroundColor: AppColors.black_700,
              prefixIcon: IconWidget(icon: AppIcons.searchIcon),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.black_700,
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextWidget(
                      AppStrings.recommended,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ...List.generate(
                    5,
                    (index) => PlayListItem(
                      isPlaying: false,
                      title: "Young",
                      subtitle: "The chainsmoker",
                      image: AppImages.music1Image,
                      showMore: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
