import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/screens/auth_screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:music_app/screens/auth_screen/password_changed_screen/password_changed_screen.dart';
import 'package:music_app/screens/auth_screen/reset_password_screen/reset_password_screen.dart';
import 'package:music_app/screens/auth_screen/sign_in_screen/sign_in_screen.dart';
import 'package:music_app/screens/auth_screen/verify_otp_screen/verify_otp_screen.dart';
import 'package:music_app/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:music_app/screens/splash_screen/splash_screen.dart';

class RouteManager {
  static const initial = AppRoutes.splashScreen;
  static List<GetPage> getPages() {
    return [
      GetPage(name: AppRoutes.splashScreen, page: () => SplashScreen()),
      GetPage(name: AppRoutes.onBoardingScreen, page: () => OnBoardingScreen()),
      GetPage(name: AppRoutes.signInScreen, page: () => SignInScreen()),
      GetPage(
        name: AppRoutes.forgotPasswordScreen,
        page: () => ForgotPasswordScreen(),
      ),
      GetPage(name: AppRoutes.verifyOtpScreen, page: () => VerifyOtpScreen()),
      GetPage(
        name: AppRoutes.resetPasswordScreen,
        page: () => ResetPasswordScreen(),
      ),
      GetPage(
        name: AppRoutes.passwordChangedScreen,
        page: () => PasswordChangedScreen(),
      ),
    ];
  }
}
