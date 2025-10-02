import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/faq_screen/widget/faq_item.dart';
import 'package:music_app/widgets/appbar_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: AppStrings.faq,
      body: Column(
        children: [
          FaqItem(
            question: "What is Outfit Orbit?",
            answer:
                "Outfit Orbit is a social platform where fashion lovers can share real, unfiltered outfits, connect with like-minded individuals, and discover endless outfit inspiration. Our goal is to create a community-driven space where authenticity and creativity shine through.",
          ),
          FaqItem(
            question: "Can I upload photos or videos of my outfits?",
            answer: "Why not bro?",
          ),
        ],
      ),
    );
  }
}
