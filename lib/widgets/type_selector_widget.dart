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
    this.height,
  });
  final bool value;
  final String firstText;
  final String lastText;
  final double? height;
  final void Function(bool value) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.grey_500,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: ButtonWidget(
              enableGlassEffect: value,
              text: firstText,
              fontSize: 16,
              cardColor: Colors.transparent,
              elevation: value ? 6 : 0,
              fontWeight: FontWeight.w600,
              backgroundColor: !value ? Colors.transparent : AppColors.grey_600,
              color: !value ? AppColors.white_900 : AppColors.white,
              borderColor: Colors.transparent,
              onTap: () => onChanged(true),
            ),
          ),
          Expanded(
            child: ButtonWidget(
              enableGlassEffect: !value,
              text: lastText,
              elevation: !value ? 6 : 0,
              backgroundColor: value ? Colors.transparent : AppColors.grey_600,
              fontSize: 16,
              cardColor: Colors.transparent,
              fontWeight: FontWeight.w600,
              color: !value ? AppColors.white : AppColors.white_900,
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
