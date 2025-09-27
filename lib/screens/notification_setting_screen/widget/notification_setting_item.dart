import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/widgets/text_widget.dart';

class NotificationSettingItem extends StatelessWidget {
  const NotificationSettingItem({
    super.key,
    required this.ontap,
    required this.text,
    required this.onChanged,
  });
  final void Function() ontap;
  final String text;
  final void Function(bool vakue) onChanged;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.black,
          border: Border.all(color: AppColors.grey_500, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            TextWidget(
              text,
              fontWeight: FontWeight.w400,
              color: AppColors.grey_300,
            ),
            Spacer(),
            SizedBox(
              child: Switch.adaptive(
                value: true,
                activeTrackColor: AppColors.orange,
                padding: EdgeInsets.zero,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
