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
    this.elevation,
    this.width,
    this.cardColor,
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
    this.cardColor,
    this.backgroundColor,
    this.elevation,
    this.borderColor,
    this.color,
    this.enableGlassEffect = true,
  }) : buttonType = ButtonType.icon;
  String? text;
  String? icon;
  double? width;
  FontWeight? fontWeight;
  double? height;
  double? fontSize;
  Color? color;
  Color? backgroundColor;
  Color? cardColor;
  Color? borderColor;
  double? elevation;
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
        child: Card(
          elevation: elevation ?? 6,
          color: cardColor ?? AppColors.white,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(100),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
               // color: borderColor ?? AppColors.grey_60,
                width: 0.1,
              ),
              shape: BoxShape.circle,
            ),
            child:
                CircleAvatar(
                  backgroundColor: backgroundColor ?? AppColors.black_900,
                  child: IconWidget(
                    icon: icon!,
                    width: 32,
                    height: 32,
                    color: color ?? AppColors.white,
                  ),
                ).asGlass(
                  tintColor: Colors.white, // subtle white tint
                  clipBorderRadius: BorderRadius.circular(25),
                  enabled: enableGlassEffect,
                ),
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
          color: color ?? AppColors.orange,
        ),
      );
    }
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: onTap,
      child: Card(
        color: cardColor ?? AppColors.black_900,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        borderOnForeground: false,
        elevation: elevation ?? 6,
        child:
            Container(
              height: height ?? 48,
              width: width ?? double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: backgroundColor ?? AppColors.grey_800.withOpacity(0.2),
                border: Border.all(
                  color: borderColor ?? AppColors.black_900,
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
      ),
    );
  }
}
