import 'package:doctor_pet/views/login/login.dart';
import 'package:doctor_pet/views/pet/Screenmain.dart';
import 'package:get/get.dart';

import '../views/home/home_binding.dart';
import '../views/home/home_view.dart';
import 'package:doctor_pet/views/pet/pet_view.dart';
import 'package:doctor_pet/views/pet/pet_binding.dart';

class AppRoutes {
  AppRoutes._();

  static final mainRoutes = [
    GetPage(
      name: RoutesName.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.pet,
      page: () => const Screenmain(),
      binding: PetBinding(),
    ),
    
  ];
  
}

class RoutesName {
  static const String home = '/home';
  static const String pet = '/pet';
}
