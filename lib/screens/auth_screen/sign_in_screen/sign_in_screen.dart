import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/auth_screen/sign_in_screen/controller/sign_in_controller.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_header_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_template_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/checkbox_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/divider_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/password_visibility_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/text_field_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SignInController(),
      builder: (controller) {
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
              controller: controller.emailController,
            ),
            TextFieldWidget(
              label: AppStrings.password,
              hintText: AppStrings.enterPassword,
              obscureText: !controller.isVisiblePassword.value,
              controller: controller.passwordController,
              suffixIcon: PasswordVisibilityWidget(
                onChanged: controller.onIsVisiblePassword,
                isVisible: controller.isVisiblePassword.value,
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                CheckboxWidget(
                  value: controller.isRememberMe.value,
                  onChanged: controller.onClickedRememberMe,
                ),
                TextWidget(
                  AppStrings.rememberMe,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white_900,
                ),
                Spacer(),
                ButtonWidget.text(
                  onTap: controller.onForgotPassword,
                  text: AppStrings.forgotPasswordQ,
                ),
              ],
            ),
            SizedBox(height: 30),

            // Container(
            //   height: 50,
            //   width: 250,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(30),
            //     gradient: const LinearGradient(
            //       colors: [
            //         Color(0xFF2C2C2C), // top part dark
            //         Color(0xFF1A1A1A), // bottom darker
            //       ],
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //     ),
            //   ),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(30),
            //       border: Border.all(
            //         width: 1.2,
            //         style: BorderStyle.solid,
            //         // lighting gradient border
            //         color: Colors.transparent,
            //       ),
            //       gradient: const LinearGradient(
            //         colors: [
            //           Color(0x80FFFFFF), // soft white highlight
            //           Color(0x20FFFFFF), // subtle fade
            //         ],
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomRight,
            //       ),
            //     ),
            //     child: const Center(
            //       child: Text(
            //         "Create Account",
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 16,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // LightingButton(text: AppStrings.signIn, onTap: () {}),
            ButtonWidget(
              onTap: controller.onSignin,
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
                  color: AppColors.white_900,
                ),
                SizedBox(width: 10),
                DividerWidget(reverse: true),
              ],
            ),
            SizedBox(height: 30),
            ButtonWidget(
              onTap: () {},
              text: AppStrings.signWithGoogle,
              icon: AppIcons.googleIcon,
              iconPosition: IconPosition.beforeText,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  AppStrings.dontHaveAccount,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white_900,
                ),
                SizedBox(width: 2),
                ButtonWidget.text(
                  text: AppStrings.signUpNow,
                  fontWeight: FontWeight.w400,
                  onTap: controller.onSignUp,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
