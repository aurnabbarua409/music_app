import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/screens/bottom_navbar_screen/controller/bottom_nav_controller.dart';
import 'package:music_app/widgets/custom_bottom_navbar_widget.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
 

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: BottomNavController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: controller.pages[controller.selectedIndex.value],
          bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: controller.selectedIndex.value,
            onItemSelected: (value) => controller.onNavItemTapped(value),
          ),
        );
      }
    );
  }
}
