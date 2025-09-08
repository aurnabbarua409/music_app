import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/auth_screen/sign_in_screen/controller/sign_in_controller.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_header_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_template_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/divider_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/signin_button_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/text_field_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _controller = Get.put(SignInController());
  @override
  void initState() {
    super.initState();
    _controller.emailController = TextEditingController();
    _controller.passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.emailController.dispose();
    _controller.passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthTemplateWidget(
      showLeading: false,
      body: [
        AuthHeaderWidget(
          title: AppStrings.welcomeBack,
          subtitle: AppStrings.signinDetails,
        ),
        TextFieldWidget(
          label: AppStrings.emailAdress,
          hintText: AppStrings.enterEmailAddress,
          controller: _controller.emailController,
        ),
        TextFieldWidget(
          label: AppStrings.password,
          hintText: AppStrings.enterPassword,
          controller: _controller.passwordController,
        ),
        SizedBox(height: 15),
        Obx(
          () => Row(
            children: [
              SizedBox(
                height: 16,
                width: 16,
                child: Checkbox.adaptive(
                  activeColor: AppColor.orange,
                  value: _controller.isRememberMe.value,
                  onChanged: (value) {
                    _controller.onClickedRememberMe();
                  },
                ),
              ),
              SizedBox(width: 10),
              TextWidget(
                AppStrings.rememberMe,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.white_900,
              ),
              Spacer(),
              ButtonWidget.text(
                onTap: _controller.onForgotPassword,
                text: AppStrings.forgotPasswordQ,
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        ButtonWidget(
          onTap: _controller.onSignin,
          text: AppStrings.signIn,
          width: double.infinity,
        ),
        SizedBox(height: 20),
        Row(
          children: [
            DividerWidget(),
            SizedBox(width: 10),
            TextWidget(
              AppStrings.orSignInWith,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppColor.white_900,
            ),
            SizedBox(width: 10),
            DividerWidget(reverse: true),
          ],
        ),
        SizedBox(height: 30),
        SigninButtonWidget(onTap: () {}),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              AppStrings.dontHaveAccount,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColor.white_900,
            ),
            SizedBox(width: 2),
            ButtonWidget.text(
              text: AppStrings.signUpNow,
              fontWeight: FontWeight.w400,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
