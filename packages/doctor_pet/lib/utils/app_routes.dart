import 'package:get/get.dart';

import '../views/home/home_binding.dart';
import '../views/home/home_view.dart';
import '../views/register/register_view.dart';
import '../views/register/register_binding.dart';

class AppRoutes {
  AppRoutes._();

  static final mainRoutes = [
    GetPage(
      name: RoutesName.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}

class RoutesName {
  static const String home = '/home';
  static const String register = '/register';
}
