import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';

class PasswordVisibilityWidget extends StatelessWidget {
  const PasswordVisibilityWidget({
    super.key,
    required this.onChanged,
    required this.isVisible,
  });
  final void Function() onChanged;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onChanged,
      icon: Icon(
        isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        color: AppColor.grey_60,
      ),
    );
  }
}
