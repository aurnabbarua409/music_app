import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.image, this.height, this.width});
  final String image;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: height ?? double.infinity,
      width: width ?? double.infinity,
     
    );
  }
}
