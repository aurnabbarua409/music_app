import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';

class FaqItem extends StatelessWidget {
  const FaqItem({super.key, required this.question, required this.answer});
  final String question;
  final String answer;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
        backgroundColor: const Color.fromARGB(54, 0, 0, 0),
        iconColor: AppColors.grey_300,
        collapsedIconColor: AppColors.grey_300,
        collapsedBackgroundColor: const Color.fromARGB(54, 0, 0, 0),
        // expansionAnimationStyle: AnimationStyle(
        //   curve: Curves.easeInOut,
        //   duration: Duration(milliseconds: 300),
        // ),
        title: Text(question, style: TextStyle(color: AppColors.grey_300)),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(answer, style: TextStyle(color: AppColors.grey_300)),
            ),
          ),
        ],
      ),
    );
  }
}
