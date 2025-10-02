import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_field_widget.dart';

class AddThisPlaylist extends StatelessWidget {
  const AddThisPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppbarWidget(
      title: "Add To This Playlist",
      body: Column(
        children: [
          TextFieldWidget(
            hintText: AppStrings.search,
            labelFontSize: 20,
            labelFontweight: FontWeight.w700,
            labelColor: AppColors.white,
            borderRadius: 12,
            borderWidth: 0.2,
            backgroundColor: AppColors.black,
            prefixIcon: IconWidget(icon: AppIcons.searchIcon),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
          ),
        ],
      ),
    );
  }
}
