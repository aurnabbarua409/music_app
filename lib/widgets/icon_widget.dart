import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.icon, this.height, this.width});
  final String icon;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Image.asset(icon, height: height, width: width);
  }
}
