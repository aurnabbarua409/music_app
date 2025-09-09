import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/screens/auth_screen/reset_password_screen/controller/reset_password_controller.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_header_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_template_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/password_visibility_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/glassEffectContainer.dart';
import 'package:music_app/widgets/text_field_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _controller = Get.put(ResetPasswordController());

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
    return AuthTemplateWidget(
      body: [
        AuthHeaderWidget(
          title: AppStrings.resetPassword,
          subtitle: AppStrings.resetPasswordDetails,
        ),
        Obx(
          () => TextFieldWidget(
            label: AppStrings.enterNewPassword,
            hintText: AppStrings.enterYourPassword,
            obscureText: !_controller.isVisibleNewPassword.value,
            suffixIcon: PasswordVisibilityWidget(
              onChanged: _controller.onClickedIsVisibleNewPassword,
              isVisible: _controller.isVisibleNewPassword.value,
            ),
          ),
        ),
        Obx(
          () => TextFieldWidget(
            label: AppStrings.confirmNewPassword,
            hintText: AppStrings.enterYourPassword,
            obscureText: !_controller.isVisibleConfirmPassword.value,
            suffixIcon: PasswordVisibilityWidget(
              onChanged: _controller.onClickedIsVisibleConfirmPassword,
              isVisible: _controller.isVisibleConfirmPassword.value,
            ),
          ),
        ),
        SizedBox(height: 30),
        ButtonWidget(
          onTap: _controller.onUpdatePassword,
          text: AppStrings.updatePassword,
          width: double.infinity,
        ),
        // GlassContainer(
        //   height: 50,
        //   child: Text("data"),
        //   lightingDirection: LightingDirection.topLeft,
        //   onTap: () {
        //     Get.toNamed(AppRoutes.passwordChangedScreen);
        //   },
        //   // backgroundColor: AppColor.black,
        // ),
      ],
    );
  }
}
