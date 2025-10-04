import 'package:music_app/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:music_app/widgets/text_widget.dart';

class MoreItem extends StatelessWidget {
  const MoreItem({super.key, required this.icon, required this.text, required this.ontap});
  final String icon;
  final String text;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: ontap,
        child: Row(
          children: [
            IconWidget(icon: icon),
            SizedBox(width: 10),
            TextWidget(text),
          ],
        ),
      ),
    );
  }
}
