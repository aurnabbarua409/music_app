import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/screens/playlist_screen/widgets/icon_button_widget.dart';
import 'package:music_app/widgets/image_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class PlayListItem extends StatelessWidget {
  const PlayListItem({
    super.key,
    required this.isPlaying,
    this.ontap,
    required this.title,
    required this.subtitle,
    required this.image,
    this.showMore = true,
    this.backgroundColor,
    this.borderColor = Colors.transparent,
  });
  final bool isPlaying;
  final void Function()? ontap;
  final String title;
  final String subtitle;
  final String image;
  final bool showMore;
  final Color? backgroundColor;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,

      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Card(
          elevation: 6,
          color: backgroundColor,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(15),
          ),
          child:
              Container(
                // margin: EdgeInsets.symmetric(vertical: 7),
                decoration: BoxDecoration(
                  color:
                      backgroundColor ??
                      (isPlaying ? AppColors.black_900 : AppColors.black),
                  // border: Border.all(color: AppColors.grey_60, width: 0.2),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: borderColor, width: 0.3),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 52,
                width: double.infinity,
                child: Row(
                  children: [
                    ImageWidget(
                      image: AppImages.music1Image,
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          title,
                          color: AppColors.orange,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        TextWidget(
                          subtitle,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white_900,
                        ),
                      ],
                    ),
                    Spacer(),
                    if (isPlaying)
                      IconButtonWidget(
                        icon: AppIcons.musicPLayingIcon,
                        width: 18,
                        height: 18,
                        onTap: () {},
                      ),
                    SizedBox(width: 10),
                    IconButtonWidget(
                      icon: AppIcons.addCircleIcon,
                      height: 13.33,
                      onTap: () {},
                    ),
                    if (showMore) ...[
                      SizedBox(width: 10),
                      IconButtonWidget(
                        icon: AppIcons.moreVertIcon,
                        height: 16,
                        onTap: () {},
                      ),
                    ],
                  ],
                ),
              ).asGlass(
                tintColor: backgroundColor ?? AppColors.white,
                clipBorderRadius: BorderRadius.circular(15),
              ),
        ),
      ),
    );
  }
}
