import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:music_app/constants/app_color.dart';
import 'package:music_app/constants/app_strings.dart';
import 'package:music_app/screens/auth_screen/verify_otp_screen/controller/verify_otp_controller.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_header_widget.dart';
import 'package:music_app/screens/auth_screen/widgets/auth_template_widget.dart';
import 'package:music_app/widgets/button_widget.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final _controller = Get.put(VerifyOtpController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.oninit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.ondispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthTemplateWidget(
      body: [
        AuthHeaderWidget(
          title: AppStrings.verifyOtp,
          subtitle: AppStrings.verifyOtpDetails,
        ),
        Row(
          children: List.generate(_controller.otpLength, (index) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  height: 60,
                  width: 50,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _controller.otpController[index],
                    focusNode: _controller.focusNode[index],
                    autofocus: true,
                    style: TextStyle(color: AppColors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      filled: true,
                      fillColor: AppColors.black_800,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.black_800),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.black_800),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.black_800),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty &&
                          index < _controller.otpLength - 1) {
                        FocusScope.of(
                          context,
                        ).requestFocus(_controller.focusNode[index + 1]);
                      }
                      if (index == _controller.otpLength - 1) {
                        _controller.onVerify();
                      }
                    },
                  ),
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 20),
        ButtonWidget(
          onTap: _controller.onVerify,
          text: AppStrings.verify,
          width: double.infinity,
        ),
      ],
    );
  }
}
