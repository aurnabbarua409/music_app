import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/widgets/button_widget.dart';

class TypeSelectorWidget extends StatelessWidget {
  const TypeSelectorWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.firstText,
    required this.lastText,
  });
  final bool value;
  final String firstText;
  final String lastText;
  final void Function(bool value) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColor.grey_500,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: ButtonWidget(
              enableGlassEffect: value,
              text: firstText,
              fontSize: 16,
              height: 44,
              fontWeight: FontWeight.w600,
              backgroundColor: !value ? Colors.transparent : AppColor.grey_600,
              color: !value ? AppColor.white_900 : AppColor.white,
              borderColor: Colors.transparent,
              onTap: () => onChanged(true),
            ),
          ),
          Expanded(
            child: ButtonWidget(
              enableGlassEffect: !value,
              text: lastText,
              backgroundColor: value ? Colors.transparent : AppColor.grey_600,
              fontSize: 16,
              height: 44,
              fontWeight: FontWeight.w600,
              color: !value ? AppColor.white : AppColor.white_900,
              borderColor: Colors.transparent,
              onTap: () => onChanged(false),
            ),
          ),
        ],
      ),
    ).asGlass(
      tintColor: Colors.white, // subtle white tint
      blurX: 20, // horizontal blur
      blurY: 20, // vertical blur
      clipBorderRadius: BorderRadius.circular(25),
    );
  }
}
