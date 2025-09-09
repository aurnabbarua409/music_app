import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

enum ButtonType { text, elevated, icon }

enum IconPosition { beforeText, afterText }

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
    this.text,
    this.icon,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.color,
    this.backgroundColor,
    this.borderColor,
    required this.onTap,
    this.iconPosition,
    this.width,
  }) : buttonType = ButtonType.elevated;
  ButtonWidget.text({
    super.key,
    required this.text,
    required this.onTap,
    this.fontSize,
    this.color,
    this.fontWeight,
  }) : buttonType = ButtonType.text;
  ButtonWidget.icon({super.key, required this.icon, required this.onTap})
    : buttonType = ButtonType.icon;
  String? text;
  String? icon;
  double? width;
  double? height;
  FontWeight? fontWeight;
  double? fontSize;
  Color? color;
  Color? backgroundColor;
  Color? borderColor;
  IconPosition? iconPosition;
  final void Function() onTap;
  final ButtonType buttonType;
  @override
  Widget build(BuildContext context) {
    if (buttonType == ButtonType.icon) {
      return InkWell(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: AppColor.black_900,
          child: IconWidget(icon: icon!, width: 32, height: 32),
        ),
      );
    }
    if (buttonType == ButtonType.text) {
      return InkWell(
        onTap: onTap,
        child: TextWidget(
          text!,
          fontSize: fontSize ?? 12,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? AppColor.orange,
        ),
      );
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 48,
        width: width ?? double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColor.black_900,
          border: Border.all(color: borderColor ?? AppColor.white, width: 0.5),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null && iconPosition == IconPosition.beforeText)
              IconWidget(icon: icon!),
            SizedBox(width: 10),
            TextWidget(
              text ?? "",
              color: color,
              fontSize: fontSize ?? 18,
              fontWeight: fontWeight ?? FontWeight.w700,
            ),
            SizedBox(width: 10),
            if (icon != null && iconPosition == IconPosition.afterText)
              IconWidget(icon: icon!),
          ],
        ),
      ),
    );
  }
}
