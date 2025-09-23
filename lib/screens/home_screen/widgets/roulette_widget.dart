import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/home_screen/controller/home_controller.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:roulette/roulette.dart';
import 'package:slot_machine_roller/slot_machine_roller.dart';

class RouletteWidget extends StatelessWidget {
  const RouletteWidget({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey_60, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              width: 155,
              height: 155,
              child: Roulette(
                group: RouletteGroup([
                  RouletteUnit.text("text", color: Colors.red),
                  RouletteUnit.text("text"),
                  RouletteUnit.text("text"),
                  RouletteUnit.text("text"),
                ]),
                controller: controller.rouletteController,
                style: RouletteStyle(
                  dividerThickness: 2,
                  centerStickerColor: AppColors.green_900,
                  // Customize appearance
                ),
              ),
            ),
            SizedBox(height: 20),
            ButtonWidget(
              onTap: controller.onSpinRoulette,
              width: 320,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              text: AppStrings.spintoDiscoverLuckySong,
              icon: AppIcons.musicIcon1,
              iconPosition: IconPosition.beforeText,
            ),
          ],
        ),
      ),
    );
  }
}
