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
    this.backgroundColor,
    this.obscureText = false,
    this.maxLines,
  });
  final String? label;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final Color? backgroundColor;
  final int? maxLines;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (label != null) ...[
            Align(
              alignment: Alignment.centerLeft,
              child: TextWidget(
                label!,
                textAlign: TextAlign.left,
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: AppColors.white_900,
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
              style: TextStyle(
                color: AppColors.grey_60,
                backgroundColor: backgroundColor,
              ),
              maxLines: maxLines,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColors.grey_60,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                focusColor: AppColors.grey_60,
                fillColor: AppColors.grey_60,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey_60),
                  borderRadius: BorderRadius.circular(25),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey_60),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
