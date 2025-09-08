import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/auth_screen/forgot_password_screen/controller/forgot_password_controller.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_header_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_template_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/text_field_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _controller = Get.put(ForgotPasswordController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthTemplateWidget(
      body: [
        AuthHeaderWidget(
          title: AppStrings.forgotPassword,
          subtitle: AppStrings.forgotPasswordDetails,
        ),
        TextFieldWidget(
          label: AppStrings.emailAdress,
          hintText: AppStrings.enterEmailAddress,
          controller: _controller.emailController,
        ),
        SizedBox(height: 30),
        ButtonWidget(
          onTap: _controller.onConfirm,
          text: AppStrings.confirm,
          width: double.infinity,
        ),
      ],
    );
  }
}
