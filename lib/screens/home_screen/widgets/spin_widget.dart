import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/widgets/button_widget.dart';

class SpinWidget extends StatelessWidget {
  const SpinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.grey_60),
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Image.asset(AppImages.spinWheel),
          SizedBox(height: 20),
          ButtonWidget(
            onTap: () {},
            width: 320,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            text: AppStrings.spintoDiscoverLuckySong,
            icon: AppIcons.musicIcon1,
            iconPosition: IconPosition.beforeText,
          ),
        ],
      ),
    );
  }
}
