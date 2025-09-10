import 'package:flutter/material.dart';
import 'package:music_app/widgets/icon_widget.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.scale,
    this.fit = BoxFit.fitHeight,
    required this.onTap,
  });
  final String icon;
  final double? width, height, scale;
  final BoxFit? fit;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: IconWidget(
        icon: icon,
        width: width,
        height: height,
        scale: scale,
        fit: fit,
      ),
    );
  }
}
