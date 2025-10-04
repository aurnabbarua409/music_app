import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/routes/app_routes.dart';
import 'package:music_app/screens/about_app_screen/about_app_screen.dart';
import 'package:music_app/screens/add_this_playlist/add_this_playlist.dart';
import 'package:music_app/screens/auth_screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:music_app/screens/auth_screen/password_changed_screen/password_changed_screen.dart';
import 'package:music_app/screens/auth_screen/reset_password_screen/reset_password_screen.dart';
import 'package:music_app/screens/auth_screen/sign_in_screen/sign_in_screen.dart';
import 'package:music_app/screens/auth_screen/sign_up_screen/sign_up_screen.dart';
import 'package:music_app/screens/auth_screen/verify_otp_screen/verify_otp_screen.dart';
import 'package:music_app/screens/bottom_navbar_screen/bottom_navbar_screen.dart';
import 'package:music_app/screens/change_password_screen/change_password_screen.dart';
import 'package:music_app/screens/edit_info_screen/edit_info_screen.dart';
import 'package:music_app/screens/edit_playlist_screen/edit_playlist_screen.dart';
import 'package:music_app/screens/help_support_screen/help_support_screen.dart';
import 'package:music_app/screens/create_new_playlist_screen/create_new_playlist_screen.dart';
import 'package:music_app/screens/delete_account_screen/delete_account_screen.dart';
import 'package:music_app/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:music_app/screens/faq_screen/faq_screen.dart';
import 'package:music_app/screens/help_support_screen/help_support_screen.dart';
import 'package:music_app/screens/home_screen/home_screen.dart';
import 'package:music_app/screens/liked_playlist_screen/liked_playlist_screen.dart';
import 'package:music_app/screens/liked_song_screen/liked_song_screen.dart';
import 'package:music_app/screens/new_playlist_screen/new_playlist_screen.dart';
import 'package:music_app/screens/notification_screen/notification_screen.dart';
import 'package:music_app/screens/notification_setting_screen/notification_setting_screen.dart';
import 'package:music_app/screens/now_playing_screen/now_playing_screen.dart';
import 'package:music_app/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:music_app/screens/password_security_screen/password_security_screen.dart';
import 'package:music_app/screens/playlist_screen/playlist_screen.dart';
import 'package:music_app/screens/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:music_app/screens/profile_screen/profile_screen.dart';
import 'package:music_app/screens/splash_screen/splash_screen.dart';
import 'package:music_app/screens/term_condition_screen/term_condition_screen.dart';
import 'package:music_app/screens/upload_song_screen/upload_song_screen.dart';
import 'package:music_app/widgets/custom_transition_widget.dart';

class RouteManager {
  static const initial = AppRoutes.splashScreen;
  static GetPage customPage({
    required String name,
    required Widget page,
    Transition? transition,
  }) {
    return GetPage(
      name: name,
      page: () => page,
      transition: transition,
      customTransition: transition == null ? CustomTransitionWidget() : null,
      transitionDuration: Duration(milliseconds: 700),
    );
  }

  static List<GetPage> getPages() {
    return [
      customPage(name: AppRoutes.splashScreen, page: SplashScreen()),
      customPage(
        name: AppRoutes.onBoardingScreen,
        page: OnBoardingScreen(),
        // transitionDuration: Duration(seconds: 1),
      ),
      customPage(name: AppRoutes.signInScreen, page: SignInScreen()),
      customPage(
        name: AppRoutes.forgotPasswordScreen,
        page: ForgotPasswordScreen(),
      ),
      customPage(name: AppRoutes.verifyOtpScreen, page: VerifyOtpScreen()),
      customPage(
        name: AppRoutes.resetPasswordScreen,
        page: ResetPasswordScreen(),
      ),
      customPage(
        name: AppRoutes.passwordChangedScreen,
        page: PasswordChangedScreen(),
      ),
      customPage(name: AppRoutes.signUpScreen, page: SignUpScreen()),
      customPage(name: AppRoutes.homeScreen, page: HomeScreen()),
      customPage(
        name: AppRoutes.bottomNavBarScreen,
        page: BottomNavbarScreen(),
        transition: Transition.size,
      ),
      customPage(
        name: AppRoutes.createNewPlaylist,
        page: CreateNewPlaylistScreen(),
      ),
      customPage(name: AppRoutes.playListScreen, page: PlaylistScreen()),
      customPage(
        name: AppRoutes.nowPlayingScreen,
        page: NowPlayingScreen(),

        // transitionDuration: Duration(milliseconds: 800),
      ),
      customPage(
        name: AppRoutes.notificationSettingScreen,
        page: NotificationSettingScreen(),
      ),
      customPage(
        name: AppRoutes.passwordSecurityScreen,
        page: PasswordSecurityScreen(),
      ),
      customPage(
        name: AppRoutes.changePasswordSceen,
        page: ChangePasswordScreen(),
      ),
      customPage(
        name: AppRoutes.deleteAccountSceen,
        page: DeleteAccountScreen(),
      ),
      customPage(name: AppRoutes.helpSupportScreen, page: HelpSupportScreen()),
      customPage(name: AppRoutes.aboutAppScreen, page: AboutAppScreen()),
      customPage(name: AppRoutes.faqScreen, page: FaqScreen()),
      customPage(
        name: AppRoutes.termConditionScreen,
        page: TermConditionScreen(),
      ),
      customPage(
        name: AppRoutes.privacyPolicyScreen,
        page: PrivacyPolicyScreen(),
      ),

      customPage(
        name: AppRoutes.notificationScreen,
        page: NotificationScreen(),
      ),
      customPage(name: AppRoutes.newPlaylistScreen, page: NewPlaylistScreen()),
      customPage(name: AppRoutes.profileScreen, page: ProfileScreen()),
      customPage(name: AppRoutes.editProfileScreen, page: EditProfileScreen()),
      customPage(
        name: AppRoutes.addThisPlaylistScreen,
        page: AddThisPlaylist(),
      ),
      customPage(name: AppRoutes.editInfoScreen, page: EditInfoScreen()),
      customPage(
        name: AppRoutes.editPlaylistScreen,
        page: EditPlaylistScreen(),
      ),
      customPage(name: AppRoutes.likedSongScreen, page: LikedSongScreen()),
      customPage(
        name: AppRoutes.likedPlaylistScreen,
        page: LikedPlaylistScreen(),
      ),
      customPage(name: AppRoutes.uploadNewSongScreen, page: UploadSongScreen())
    ];
  }
}
