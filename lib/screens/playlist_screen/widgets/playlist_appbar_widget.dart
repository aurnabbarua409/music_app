import 'package:flutter/material.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class PlaylistAppbarWidget extends StatelessWidget {
  const PlaylistAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonWidget.icon(icon: AppIcons.arrowLeftIcon, onTap: () {}),
        Expanded(
          child: TextWidget(
            AppStrings.playlist,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        ButtonWidget.icon(icon: AppIcons.loveIcon, onTap: () {}),
      ],
    );
  }
}
