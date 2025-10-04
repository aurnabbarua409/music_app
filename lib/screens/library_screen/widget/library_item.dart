import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class LibraryItem extends StatelessWidget {
  const LibraryItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.scale = 0.7,
    required this.ontap,
  });
  final String icon;
  final String title;
  final String subtitle;
  final double scale;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: ontap,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.grey_60, width: 0.2),
              gradient: LinearGradient(
                colors: [AppColors.black_700, AppColors.black_900],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconWidget(icon: icon, scale: scale),
                SizedBox(height: 5),
                TextWidget(title, fontSize: 18, fontWeight: FontWeight.w700),
                TextWidget(
                  subtitle,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white_900,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
