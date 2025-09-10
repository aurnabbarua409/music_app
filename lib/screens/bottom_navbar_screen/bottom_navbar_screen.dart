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
  final _controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _controller.pages[_controller.selectedIndex.value],
        bottomNavigationBar: CustomBottomNavBar(
          selectedIndex: _controller.selectedIndex.value,
          onItemSelected: (value) => _controller.onNavItemTapped(value),
        ),
      ),
    );
  }
}
