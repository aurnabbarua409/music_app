import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_icons.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/auth_screen/sign_up_screen/controller/sign_up_controller.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_header_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_template_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/checkbox_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/divider_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/password_visibility_widget.dart';
import 'package:music_app/widgets/button_widget.dart';
import 'package:music_app/widgets/text_field_widget.dart';
import 'package:music_app/widgets/text_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _controller = Get.put(SignUpController());

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
      showLeading: false,
      body: [
        AuthHeaderWidget(
          title: AppStrings.signUp,
          subtitle: AppStrings.signUpDatails,
        ),

        Obx(
          () =>
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.grey_500,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        enableGlassEffect: !_controller.isArtist.value,
                        text: AppStrings.regularUser,
                        fontSize: 16,
                        height: 44,
                        fontWeight: FontWeight.w600,
                        backgroundColor: _controller.isArtist.value
                            ? Colors.transparent
                            : AppColor.grey_600,
                        color: _controller.isArtist.value
                            ? AppColor.white_900
                            : AppColor.white,
                        borderColor: Colors.transparent,
                        onTap: () => _controller.onChooseUserType(false),
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        enableGlassEffect: _controller.isArtist.value,
                        text: AppStrings.artist,
                        backgroundColor: !_controller.isArtist.value
                            ? Colors.transparent
                            : AppColor.grey_600,
                        fontSize: 16,
                        height: 44,
                        fontWeight: FontWeight.w600,
                        color: _controller.isArtist.value
                            ? AppColor.white
                            : AppColor.white_900,
                        borderColor: Colors.transparent,
                        onTap: () => _controller.onChooseUserType(true),
                      ),
                    ),
                  ],
                ),
              ).asGlass(
                tintColor: Colors.white, // subtle white tint
                blurX: 20, // horizontal blur
                blurY: 20, // vertical blur
                clipBorderRadius: BorderRadius.circular(25),
              ),
        ),
        TextFieldWidget(
          label: AppStrings.fullName,
          controller: _controller.fullNameController,
          hintText: AppStrings.enterYourFullName,
        ),
        TextFieldWidget(
          label: AppStrings.email,
          controller: _controller.emailController,
          hintText: AppStrings.enterYourEmailAddress,
        ),
        Obx(
          () => TextFieldWidget(
            label: AppStrings.password,
            controller: _controller.passwordController,
            hintText: AppStrings.createSecurePassword,
            obscureText: !_controller.isVisiblePassword.value,
            suffixIcon: PasswordVisibilityWidget(
              onChanged: _controller.onIsVisiblePassword,
              isVisible: _controller.isVisiblePassword.value,
            ),
          ),
        ),
        Obx(
          () => TextFieldWidget(
            label: AppStrings.confirmPassword,
            controller: _controller.confirmPasswordController,
            hintText: AppStrings.reEnterPassword,
            obscureText: !_controller.isVisibleConfirmPassword.value,
            suffixIcon: PasswordVisibilityWidget(
              onChanged: _controller.onIsVisibleConfirmPassword,
              isVisible: _controller.isVisibleConfirmPassword.value,
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Obx(
              () => CheckboxWidget(
                value: _controller.isAgreeTermCondition.value,
                onChanged: _controller.onIsAgreeTermAcondition,
              ),
            ),
            TextWidget(
              AppStrings.iAgreeToThe,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColor.grey_60,
            ),
            SizedBox(width: 3.5),
            ButtonWidget.text(
              text: AppStrings.termService,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              onTap: () {},
            ),
            SizedBox(width: 3.5),
            TextWidget(
              AppStrings.and,
              fontSize: 12,
              color: AppColor.grey_60,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(width: 3.5),
            ButtonWidget.text(
              text: AppStrings.privacyPolicy,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              onTap: () {},
            ),
          ],
        ),
        SizedBox(height: 25),
        ButtonWidget(
          onTap: _controller.onCreateAccount,
          text: AppStrings.createAccount,
          width: double.infinity,
        ),
        SizedBox(height: 20),
        Row(
          children: [
            DividerWidget(),
            SizedBox(width: 10),
            TextWidget(
              AppStrings.orSignUpWith,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: AppColor.white_900,
            ),
            SizedBox(width: 10),
            DividerWidget(reverse: true),
          ],
        ),
        SizedBox(height: 30),
        ButtonWidget(
          onTap: () {},
          text: AppStrings.signWithGoogle,
          iconPosition: IconPosition.beforeText,
          icon: AppIcons.googleIcon,
          width: double.infinity,
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              AppStrings.alreadyhaveAccount,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColor.white_900,
            ),
            SizedBox(width: 2),
            ButtonWidget.text(
              text: AppStrings.signInHere,
              fontWeight: FontWeight.w400,
              onTap: _controller.onSignin,
            ),
          ],
        ),
      ],
    );
  }
}
