import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    super.key,
    required this.ontap,
    required this.icon,
    required this.text,
    this.textColor = AppColors.grey_300,
    this.showIcon = true,
  });
  final void Function() ontap;
  final String icon;
  final String text;
  final Color textColor;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey_60, width: 0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            IconWidget(icon: icon),
            SizedBox(width: 10),
            TextWidget(
              text,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
            Spacer(),
            if (showIcon)
              Icon(Icons.arrow_forward_ios, color: AppColors.grey_60, size: 15),
          ],
        ),
      ),
    );
  }
}
