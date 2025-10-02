import 'package:flutter/material.dart';
import 'package:music_app/constants/app_color.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key,
    required this.title,
    required this.body,
    this.leading,
    this.actions,
  });
  final Widget body;
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.white,
        title: Text(title),
        centerTitle: true,
        leading: leading == null
            ? null
            : Padding(padding: const EdgeInsets.all(8.0), child: leading),

        actions: actions,
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: SafeArea(child: body),
    );
  }
}
