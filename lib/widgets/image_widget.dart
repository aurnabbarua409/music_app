import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      fit: fit,
    );
  }
}
