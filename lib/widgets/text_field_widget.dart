import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/widgets/text_widget.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.label,
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.backgroundColor = Colors.transparent,
    this.obscureText = false,
    this.maxLines = 1,
    this.labelFontSize = 12,
    this.labelColor = AppColors.white_900,
    this.labelFontweight = FontWeight.w400,
    this.prefixIcon,
    this.borderRadius = 25,
    this.borderWidth = 1,
    this.contentPadding,
    this.margin,
  });
  final String? label;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final Color? backgroundColor;
  final int? maxLines;
  final TextEditingController? controller;

  final double labelFontSize;
  final FontWeight labelFontweight;
  final Color labelColor;
  final Widget? prefixIcon;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsets? contentPadding;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                label!,
                textAlign: TextAlign.left,
                fontWeight: labelFontweight,
                fontSize: labelFontSize,
                color: labelColor,
              ),
            ),
            SizedBox(height: 10),
          ],
          SizedBox(
            height: maxLines == null ? 48 : null,
            child: TextFormField(
              autofocus: true,
              obscureText: obscureText,

              controller: controller,
              cursorColor: AppColors.grey_60,
              style: TextStyle(color: AppColors.grey_60),
              maxLines: maxLines,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                hintText: hintText,
                contentPadding: contentPadding,
                hintStyle: TextStyle(
                  color: AppColors.grey_60,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                focusColor: AppColors.grey_60,
                fillColor: backgroundColor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey_60,
                    width: borderWidth,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey_60,
                    width: borderWidth,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
