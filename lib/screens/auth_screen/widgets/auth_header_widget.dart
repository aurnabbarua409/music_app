import 'package:flutter/widgets.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.isPasswordChanged = false,
  });
  final String title;
  final String subtitle;
  final bool isPasswordChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconWidget(
          icon: isPasswordChanged
              ? AppIcons.confirmedIcon
              : AppIcons.orangeIcon,
        ),
        SizedBox(height: 20),
        TextWidget(title, fontWeight: FontWeight.w700, fontSize: 30),
        SizedBox(height: 10),
        TextWidget(
          subtitle,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColor.white_900,
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
