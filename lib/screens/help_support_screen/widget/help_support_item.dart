import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class HelpSupportItem extends StatelessWidget {
  const HelpSupportItem({
    super.key,
    required this.ontap,
    required this.icon,
    required this.text,
    this.textColor = AppColors.grey_300,
  });
  final void Function() ontap;
  final String icon;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.black,
          border: Border.all(color: AppColors.grey_500, width: 1.5),
          borderRadius: BorderRadius.circular(20),
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
            Icon(Icons.arrow_forward_ios, color: AppColors.grey_60, size: 15),
          ],
        ),
      ),
    );
  }
}
