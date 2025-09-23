import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';

class CheckboxWidget extends StatelessWidget {
  const CheckboxWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final bool value;
  final void Function() onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 16,
          width: 16,
          child: Checkbox.adaptive(
            activeColor: AppColors.orange,
            value: value,
            onChanged: (value) {
              onChanged();
            },
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
