import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

enum ButtonType { text, elevated }

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, this.text, this.icon, required this.onTap});
  final String? text;
  final String? icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.black_900,
          border: Border.all(color: AppColor.white, width: 0.5),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(text ?? "", fontSize: 18, fontWeight: FontWeight.w700),
            SizedBox(width: 10),
            IconWidget(icon: icon ?? ""),
          ],
        ),
      ),
    );
  }
}
