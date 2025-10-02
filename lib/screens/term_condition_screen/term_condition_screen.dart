import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/about_app_screen/controller/about_app_controller.dart';
import 'package:music_app/screens/term_condition_screen/controller/term_condition_controller.dart';
import 'package:music_app/widgets/appbar_widget.dart';

class TermConditionScreen extends StatelessWidget {
  const TermConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: AppStrings.termCondition,
      body: GetBuilder(
        init: TermConditionController(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: HtmlWidget(
              controller.terms.value,
              textStyle: TextStyle(color: AppColors.white),
            ),
          );
        },
      ),
    );
  }
}
