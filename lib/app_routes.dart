import 'package:care/pages/auth/splash_page.dart';
import 'package:care/pages/home/home_page.dart';
import 'package:care/pages/profile/profile_page.dart';
import 'package:get/get.dart';
import 'package:care/widgets/bottom_nav_bar.dart';

class AppRoutes {
  static const String splashPage = '/splash_page';
  static const String bottomNavBar = '/bottom_nav_bar';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';

  static final routes = [
    GetPage(name: splashPage, page: () => const SplashPage()),
    GetPage(name: bottomNavBar, page: () => const CustomBottomNavBar()),
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: profile, page: () => const ProfilePage()),
  ];
}
