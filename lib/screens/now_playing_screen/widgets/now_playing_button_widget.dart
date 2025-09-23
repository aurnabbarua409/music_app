import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class NowPlayingButtonWidget extends StatelessWidget {
  const NowPlayingButtonWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.ontap,
  });
  final String icon;
  final String text;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Row(
            children: [
              IconWidget(
                icon: icon,
                width: 16,
                height: 16,
                color: AppColors.white,
              ),
              SizedBox(width: 10),
              TextWidget(
                text,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.fadeWhite,
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
