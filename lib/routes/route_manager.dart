import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/screens/auth_screen/sign_in_screen/sign_in_screen.dart';
import 'package:music_app/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:music_app/screens/splash_screen/splash_screen.dart';

class RouteManager {
  static const initial = AppRoutes.splashScreen;
  static List<GetPage> getPages() {
    return [
      GetPage(name: AppRoutes.splashScreen, page: () => SplashScreen()),
      GetPage(name: AppRoutes.onBoardingScreen, page: () => OnBoardingScreen()),
      GetPage(name: AppRoutes.signInScreen, page: () => SignInScreen()),
    ];
  }
}
