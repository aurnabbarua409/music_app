import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/widgets/icon_widget.dart';

class BorderedIconWidget extends StatelessWidget {
  const BorderedIconWidget({super.key, required this.icon});
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.grey_800,
        shape: BoxShape.circle,
      ),
      child: IconWidget(icon: icon, color: AppColors.white),
    );
  }
}
