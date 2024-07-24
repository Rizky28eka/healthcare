import 'package:get/get.dart';
import 'package:care/pages/auth/forgot_password_page.dart';
import 'package:care/pages/auth/login_page.dart';
import 'package:care/pages/auth/splash_page.dart';
import 'package:care/pages/home/home_page.dart';
import 'package:care/pages/notification/notification_page.dart';
import 'package:care/pages/profile/profile_page.dart';

class AppRoutes {
  // Define route names
  static const splashPage = '/splash';
  static const homePage = '/home';
  static const profilePage = '/profile';
  static const loginPage = '/login';
  static const registerPage = '/register';
  static const notificationPage = '/notification';
  static const forgotPasswordPage = '/forgot-password';

  // Define route map
  static final routes = [
    GetPage(name: splashPage, page: () => const SplashPage()),
    GetPage(name: homePage, page: () => const HomePage()),
    GetPage(name: profilePage, page: () => const ProfilePage()),
    GetPage(name: loginPage, page: () => LoginPage()),
    GetPage(name: notificationPage, page: () => NotificationPage()),
    GetPage(name: forgotPasswordPage, page: () => ForgotPasswordPage()),
  ];
}
