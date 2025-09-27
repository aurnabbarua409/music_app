import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class PasswordSecurityItem extends StatelessWidget {
  const PasswordSecurityItem({
    super.key,
    required this.ontap,
    required this.text,
    required this.icon,
    required this.fontColor,
  });
  final void Function() ontap;
  final String text;
  final String icon;
  final Color fontColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.black,
          border: Border.all(color: AppColors.grey_500, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            IconWidget(icon: icon),
            SizedBox(width: 10),
            TextWidget(text, color: fontColor),
            Spacer(),
            Icon(Icons.arrow_forward_ios, color: fontColor, size: 18),
          ],
        ),
      ),
    );
  }
}
