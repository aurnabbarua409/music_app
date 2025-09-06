import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/widgets/text_widget.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, required this.label, this.controller, this.hintText});
  final String label;
  final String? hintText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextWidget(
              label,
              textAlign: TextAlign.left,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppColor.white_900,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 48,
            child: TextFormField(
              controller: controller,
              cursorColor: AppColor.grey_60,
              style: TextStyle(color: AppColor.grey_60),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColor.grey_60,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                focusColor: AppColor.grey_60,
                fillColor: AppColor.grey_60,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.grey_60),
                  borderRadius: BorderRadius.circular(25),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.grey_60),
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
