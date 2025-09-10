import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.icon,
    this.height,
    this.width,
    this.scale,
    this.color,
    this.fit,
  });
  final String icon;
  final double? height;
  final double? width;
  final double? scale;
  final Color? color;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      height: height,
      width: width,
      scale: scale,
      color: color,
      fit: fit,
    );
  }
}
