import 'package:flutter/widgets.dart';
import 'package:music_app/constants/app_color.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key, this.reverse = false});
  final bool reverse;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 1,
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: reverse
                  ? [AppColor.orange, AppColor.black]
                  : [AppColor.black, AppColor.orange],
            ),
          ),
        ),
      ),
    );
  }
}
