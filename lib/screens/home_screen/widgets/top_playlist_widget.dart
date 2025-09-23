import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/screens/home_screen/controller/home_controller.dart';
import 'package:music_app/widgets/icon_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class TopPlaylistWidget extends StatelessWidget {
  const TopPlaylistWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.controller,
  });
  final String icon;
  final String title;
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconWidget(icon: icon),
            SizedBox(width: 5),
            TextWidget(title, fontSize: 22, fontWeight: FontWeight.w700),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 175,
          child: ListView.builder(
            itemCount: controller.topPlayList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = controller.topPlayList[index];
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => Get.toNamed(AppRoutes.playListScreen),
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.zero,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item.image,
                            fit: BoxFit.cover,
                            width: 160,
                            height: 176,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [Colors.transparent, AppColors.black],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  item.title,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                                Row(
                                  children: [
                                    IconWidget(icon: AppIcons.musicIconOutline),
                                    TextWidget(
                                      '${item.totalSongs} songs',
                                      color: AppColors.white_900,
                                      fontSize: 11,
                                    ),
                                    SizedBox(width: 3),
                                    IconWidget(icon: AppIcons.playIconOutline),
                                    TextWidget(
                                      item.totalViews,
                                      color: AppColors.white_900,
                                      fontSize: 11,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
