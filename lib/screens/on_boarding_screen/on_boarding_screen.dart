import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/on_boarding_screen/controller/on_boarding_controller.dart';
import 'package:music_app/widgets/app_background_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: OnBoardingController(),
      builder: (controller) => AppBackgroundWidget(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                carouselController: controller.carouseSliderController,
                items: controller.images,

                options: CarouselOptions(
                  autoPlay: true,
                  height: 400,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  onPageChanged: (index, reason) {
                    controller.changeCurrentIndex(index);
                  },
                ),
              ),
              SizedBox(height: 30),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(controller.images.length, (index) {
                    bool isActive = index == controller.currentIndex.value;
                    return InkWell(
                      onTap: () => controller.carouseSliderController
                          .animateToPage(index),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 8,
                        width: isActive ? 25 : 8, // wider when active
                        decoration: BoxDecoration(
                          color: isActive ? AppColor.orange : AppColor.grey_60,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 30),
              TextWidget(
                AppStrings.onboardingScreentitle,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 350,
                child: TextWidget(
                  AppStrings.onBoardingScreenDetails,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 30),
              ButtonWidget(
                text: AppStrings.letsGo,
                icon: AppIcons.musicLogo,
                onTap: controller.onClickedLetsGo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
