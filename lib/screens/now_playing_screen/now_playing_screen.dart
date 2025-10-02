import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/now_playing_screen/controller/now_playing_constroller.dart';
import 'package:music_app/widgets/app_background_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class NowPlayingScreen extends StatefulWidget {
  const NowPlayingScreen({super.key});

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  final _controller = Get.put(NowPlayingController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.onInitial();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.onDispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackgroundWidget(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Obx(
          () => Column(
            children: [
              Row(
                children: [
                  ButtonWidget.icon(
                    icon: AppIcons.arrowLeftIcon,
                    onTap: _controller.onGetback,
                  ),
                  Spacer(),
                  TextWidget(
                    AppStrings.nowPlaying,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  Spacer(),
                  ButtonWidget.icon(
                    icon: AppIcons.moreVertIcon,
                    onTap: _controller.onClickMore,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: _controller.rotationController,
                      child: CircleAvatar(
                        radius: 156,
                        backgroundImage: AssetImage(
                          AppImages.onBoardingCharacter1,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextWidget(
                      'Young',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                    TextWidget(
                      'The Chainsmokers',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white_900,
                    ),
                  ],
                ),
              ),
              Slider(
                padding: EdgeInsets.zero,
                min: 0,
                max: _controller.totalTime.value.toDouble(),
                activeColor: AppColors.orange,
                value: _controller.progress.value,
                onChanged: (value) {
                  _controller.onProgressChange(value);
                },
              ),
              Row(
                children: [
                  TextWidget(
                    _controller.formatDuration(
                      _controller.progress.value.toInt(),
                    ),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white_900,
                  ),
                  Spacer(),
                  TextWidget(
                    _controller.formatDuration(_controller.totalTime.value),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white_900,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonWidget.icon(
                    icon: AppIcons.repeatIcon,
                    enableGlassEffect: false,
                    cardColor: Colors.transparent,
                    elevation: 0,
                    color: _controller.isRepeating.value
                        ? AppColors.orange
                        : AppColors.white,
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    onTap: _controller.onRepeat,
                  ),
                  ButtonWidget.icon(
                    icon: AppIcons.goPreviousIcon,
                    backgroundColor: AppColors.black,
                    onTap: _controller.onGoBackward,
                  ),
                  ButtonWidget.icon(
                    icon: !_controller.isPlaying.value
                        ? AppIcons.playBlackIcon
                        : AppIcons.pauseIcon,
                    color: AppColors.black,
                    cardColor: Colors.transparent,
                    backgroundColor: AppColors.orange,
                    onTap: _controller.isPlaying.value
                        ? _controller.onPause
                        : _controller.onResume,
                  ),
                  ButtonWidget.icon(
                    icon: AppIcons.goForwardIcon,
                    backgroundColor: AppColors.black,
                    onTap: _controller.onGoForward,
                  ),
                  ButtonWidget.icon(
                    icon: AppIcons.playListIcon,
                    enableGlassEffect: false,
                    cardColor: Colors.transparent,
                    elevation: 0,
                    onTap: _controller.onClickQueue,
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.transparent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
