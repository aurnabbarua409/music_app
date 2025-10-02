import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/home_screen/controller/home_controller.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:slot_machine_roller/slot_machine_roller.dart';

class SlotMachineWidget extends StatelessWidget {
  const SlotMachineWidget({super.key, required this.controller});
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
            // Container(
            //   color: Colors.red,
            //   height: 90,
            //   width: 200,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: controller.slotMachineItem.length,
            //     itemBuilder: (context, index) => Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: SizedBox(
            //         height: 150,
            //         child: SlotMachineRoller(
            //           height: 150,
            //           width: 50,
            //           delay: Duration(seconds: 1),
            //           reverse: true,
            //           minTarget: 0,
            //           target: controller.slotMachineTarget[index],
            //           maxTarget: controller.slotMachineItem.length - 1,
            //           itemBuilder: (e) => Container(
            //             margin: EdgeInsets.symmetric(vertical: 10),
            //             height: 50,
            //             width: 150,
            //             alignment: Alignment.center,
            //             decoration: BoxDecoration(
            //               shape: BoxShape.rectangle,
            //               color: Colors.white,
            //             ),
            //             child: Image.asset(controller.slotMachineItem[e]),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Image.asset(AppImages.spinWheel),
            SizedBox(height: 20),
            ButtonWidget(
              onTap: controller.onSpinSlotMachine,
              width: 320,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              text: 'Spin to Discover Quote of the day',
              icon: AppIcons.musicIcon1,
              iconPosition: IconPosition.beforeText,
            ),
          ],
        ),
      ),
    );
  }
}
