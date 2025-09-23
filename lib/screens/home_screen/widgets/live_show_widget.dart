import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class LiveShowWidget extends StatelessWidget {
  const LiveShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconWidget(icon: AppIcons.guiterIcon),
            SizedBox(width: 5),
            TextWidget(
              AppStrings.liveShow,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 140,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    Card(
                      elevation: 6,
                      margin: EdgeInsets.zero,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(100),
                      ),
                      child: DottedBorder(
                        options: CircularDottedBorderOptions(
                          color: AppColors.orange,
                          strokeWidth: 2,
                          dashPattern: [4, 4],
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            AppImages.onBoardingCharacter1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextWidget(
                      'The weekend',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white_900,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
