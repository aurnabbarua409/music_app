import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/widgets/text_widget.dart';

class FeatureArtistButton extends StatelessWidget {
  const FeatureArtistButton({
    super.key,
    required this.text,
    required this.ontap, required this.isSelected,
  });
  final String text;
  final void Function() ontap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.white_900 : null,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.white_900),
        ),
        child: TextWidget(
          text,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: isSelected ? AppColors.black : AppColors.white_900,
        ),
      ),
    );
  }
}
