import 'package:get/get.dart';

import '../views/home/home_binding.dart';
import '../views/home/home_view.dart';

class AppRoutes {
  AppRoutes._();

  static final mainRoutes = [
    GetPage(
      name: RoutesName.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

class RoutesName {
  static const String home = '/home';
}
