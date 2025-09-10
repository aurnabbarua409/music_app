import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/widgets/icon_widget.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final items = [
      AppIcons.homeIcon,
      AppIcons.exploreIcon,
      AppIcons.addCircleIcon,
      AppIcons.searchIcon,
      AppIcons.profileIcon,
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: AppColor.black_700),
      child:
          Container(           
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.white, width: 0.1),
              color: AppColor.grey_800,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(items.length, (index) {
                final isSelected = index == widget.selectedIndex;

                return InkWell(
                  onTap: () => widget.onItemSelected(index),
                  child:
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.1,
                            color: isSelected
                                ? AppColor.grey_60
                                : Colors.transparent,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: IconWidget(icon: items[index], scale: 1.2),
                      ).asGlass(
                        enabled: isSelected,
                        clipBorderRadius: BorderRadius.circular(50),
                        tintColor: const Color.fromARGB(255, 255, 0, 0),
                      ),
                );
              }),
            ),
          ).asGlass(
            tintColor: Colors.white, // subtle white tint
            blurX: 20, // horizontal blur
            blurY: 20, // vertical blur
            clipBorderRadius: BorderRadius.circular(25),
          ),
    );
  }
}
