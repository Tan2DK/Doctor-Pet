import 'package:doctor_pet/views/login/login.dart';
import 'package:get/get.dart';

import '../views/home/home_binding.dart';
import '../views/home/home_view.dart';

import '../views/login/login_binding.dart';
import '../views/login/login.dart';

class AppRoutes {
  AppRoutes._();

  static final mainRoutes = [
    GetPage(
      name: RoutesName.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.login,
      page: () => const loginView(),
      binding: LoginBinding(),
    ),
  ];
}

class RoutesName {
  static const String home = '/home';
  static const String login = '/login';
}
