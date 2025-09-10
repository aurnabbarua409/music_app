import 'package:flutter/material.dart';
import 'package:music_app/constants/app_images.dart';

class AppBackgroundWidget extends StatelessWidget {
  const AppBackgroundWidget({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.backgroundImage,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        SafeArea(
          child: Scaffold(backgroundColor: Colors.transparent, body: body),
        ),
      ],
    );
  }
}
