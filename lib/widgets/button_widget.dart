import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
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
    this.enableGlassEffect = true,
  }) : buttonType = ButtonType.elevated;
  ButtonWidget.text({
    super.key,
    required this.text,
    required this.onTap,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.enableGlassEffect = false,
  }) : buttonType = ButtonType.text;
  ButtonWidget.icon({
    super.key,
    required this.icon,
    required this.onTap,
    this.backgroundColor,
    this.enableGlassEffect = true,
  }) : buttonType = ButtonType.icon;
  String? text;
  String? icon;
  double? width;
  double? height;
  FontWeight? fontWeight;
  double? fontSize;
  Color? color;
  Color? backgroundColor;
  Color? borderColor;
  bool enableGlassEffect;
  IconPosition? iconPosition;
  final void Function() onTap;
  final ButtonType buttonType;
  @override
  Widget build(BuildContext context) {
    if (buttonType == ButtonType.icon) {
      return InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.fadeWhite, width: 0.1),
            shape: BoxShape.circle
          ),
          child:
              CircleAvatar(
                backgroundColor: backgroundColor ?? AppColor.black_900,
                child: IconWidget(icon: icon!, width: 32, height: 32),
              ).asGlass(
                tintColor: Colors.white, // subtle white tint
                blurX: 20, // horizontal blur
                blurY: 20, // vertical blur
                clipBorderRadius: BorderRadius.circular(25),
              ),
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
      borderRadius: BorderRadius.circular(25),
      onTap: onTap,
      child:
          Container(
            height: height ?? 48,
            width: width ?? double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColor.grey_800.withOpacity(0.2),
              border: Border.all(
                color: borderColor ?? AppColor.white,
                width: 0.2,
              ),
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
          ).asGlass(
            enabled: enableGlassEffect,
            tintColor: Colors.white, // subtle white tint
            blurX: 20, // horizontal blur
            blurY: 20, // vertical blur
            clipBorderRadius: BorderRadius.circular(25),
          ),
    );
  }
}
