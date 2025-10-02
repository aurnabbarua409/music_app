import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_images.dart';
import 'package:music_app/widgets/text_widget.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.image,
    required this.name,
    required this.status,
    required this.time,
    this.unRead = true,
  });
  final String image;
  final String name;
  final String status;
  final String time;
  final bool unRead;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.grey_300)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          unRead
              ? Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.orange,
                    ),
                  ),
                )
              : SizedBox(width: 8),
          SizedBox(width: 10),
          CircleAvatar(radius: 20, backgroundImage: AssetImage(image)),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextWidget(name, color: AppColors.orange),
                  SizedBox(width: 5),
                  TextWidget(status),
                ],
              ),
              SizedBox(height: 10),
              TextWidget(time),
              SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
