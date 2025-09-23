import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/screens/auth_screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:music_app/screens/auth_screen/password_changed_screen/password_changed_screen.dart';
import 'package:music_app/screens/auth_screen/reset_password_screen/reset_password_screen.dart';
import 'package:music_app/screens/auth_screen/sign_in_screen/sign_in_screen.dart';
import 'package:music_app/screens/auth_screen/sign_up_screen/sign_up_screen.dart';
import 'package:music_app/screens/auth_screen/verify_otp_screen/verify_otp_screen.dart';
import 'package:music_app/screens/bottom_navbar_screen/bottom_navbar_screen.dart';
import 'package:music_app/screens/create_new_playlist_screen/create_new_playlist_screen.dart';
import 'package:music_app/screens/home_screen/home_screen.dart';
import 'package:music_app/screens/now_playing_screen/now_playing_screen.dart';
import 'package:music_app/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:music_app/screens/playlist_screen/playlist_screen.dart';
import 'package:music_app/screens/splash_screen/splash_screen.dart';

class RouteManager {
  static const initial = AppRoutes.splashScreen;
  static List<GetPage> getPages() {
    return [
      GetPage(name: AppRoutes.splashScreen, page: () => SplashScreen()),
      GetPage(
        name: AppRoutes.onBoardingScreen,
        page: () => OnBoardingScreen(),
        transition: Transition.size,
        transitionDuration: Duration(seconds: 1),
      ),
      GetPage(
        name: AppRoutes.signInScreen,
        page: () => SignInScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 800),
      ),
      GetPage(
        name: AppRoutes.forgotPasswordScreen,
        page: () => ForgotPasswordScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 800),
      ),
      GetPage(
        name: AppRoutes.verifyOtpScreen,
        page: () => VerifyOtpScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 800),
      ),
      GetPage(
        name: AppRoutes.resetPasswordScreen,
        page: () => ResetPasswordScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 800),
      ),
      GetPage(
        name: AppRoutes.passwordChangedScreen,
        page: () => PasswordChangedScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 800),
      ),
      GetPage(
        name: AppRoutes.signUpScreen,
        page: () => SignUpScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 800),
      ),
      GetPage(name: AppRoutes.homeScreen, page: () => HomeScreen()),
      GetPage(
        name: AppRoutes.bottomNavBarScreen,
        page: () => BottomNavbarScreen(),
        transition: Transition.size,
        transitionDuration: Duration(seconds: 1),
      ),
      GetPage(
        name: AppRoutes.createNewPlaylist,
        page: () => CreateNewPlaylistScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 800),
      ),
      GetPage(
        name: AppRoutes.playListScreen,
        page: () => PlaylistScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 800),
      ),
      GetPage(
        name: AppRoutes.nowPlayingScreen,
        page: () => NowPlayingScreen(),
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 800),
      ),
    ];
  }
}
